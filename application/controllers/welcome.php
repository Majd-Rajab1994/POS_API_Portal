<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$api_credentials = array(
			'user1' => 'abc123',
			'user2' => 'abcxyz'
		);
		if (!isset($_SERVER['PHP_AUTH_USER'])) {
			header('WWW-Authenticate: Basic realm="x-apikey"');
			header('HTTP/1.1 401 Unauthorized');
			exit;
		}
		else
		{
			$username = $_SERVER['PHP_AUTH_USER'];
			$password = $_SERVER['PHP_AUTH_PW'];
			if (!array_key_exists($username, $api_credentials) || $password != $api_credentials[$username]) 
			{
				//header('HTTP/1.1 403 Forbidden');
				http_response_code(204);
				exit;
			}
			else
			{
				header("Access-Control-Allow-Origin: *");
				header("Content-Type: application/json; charset=UTF-8");
				$db = $this->load->database();
				$query = $this->db->get('categories');
				$finaldata = array();
				$data = [];
				$finaldata['status'] = "ok";
				$i = 0;
				foreach ($query->result() as $row1)
				{
					$data1 = $row1;
					$query2 = $this->db->get_where('products',array('id_category'=>$row1->id));
					foreach($query2->result() as $row2)
					{
						$data2 = $row2;
						$this->db->select('id, modifier_class_id, sort, name, minimum_amount, maximum_amount, admin_modifier, active, forced, amount_free_is_dollars, amount_free, admin_mod_type, split');
						$query3 = $this->db->get_where('modifier_classes',array('id_product'=>$row2->id));
						foreach ($query3->result() as $row3)
						{
							$data3 = $row3;
							$this->db->select('id, sku, sort, name, price, barcode, cost, active, selected, is_quick, image_url');
							$query4 = $this->db->get_where('modifiers',array('id_modifier_class'=>$row3->id));
							foreach ($query4->result() as $row4)
							{
								$data4 = $row4;
								$data3->modifiers[] =$data4;
							}
							$data2->modifier_classes[] = $data3;
						}
						$this->db->select('active, from_date, to_date, timetable_data, type');
						$query5 = $this->db->get_where('timetable',array('id'=>$row2->id));
						foreach($query5->result() as $row5)
						{
							$data5 = $row5;
							$data2->timetable[]= $data5;
						}
						$data1->products[]= $data2;
					}
					$data['categories'][] = $data1;
					$i++;
				}
				if($i == 0)
				{
					http_response_code(202);
					echo '{
							"status": "ERROR",
							"error": {
								"message": "",
								"code": 204,
								"details": {
								}
							}
						}';
				}
				else
				{
					$finaldata['data'] = $data;
					http_response_code(200);
					echo json_encode($finaldata);
				}
				
			}
		}
	}
	public function push_order()
	{


		$x='
		{
			"establishment": "1",
			"discount_code": "null",
			"delivery_amount": 10,
			"discount_amount" : 12,
			"items": [
				{
					"product": "1000",
					"price": 100,
					"quantity": 10,
					"special_request": "p",
					"modifieritems": [
						{
							"modifier": "10",   
							"qty": 1    
						},
						{
							"modifier": "11",   
							"qty": 1    
						}
					]
				},
				{   
					"product": "1005",      
					"price": 50,        
					"quantity": 10,      
					"special_request": "p",      
					"modifieritems": []     
				}   
			],
			"orderInfo": {
				"dining_option": "2", 
				"notes": "oo", 
				"customer": {   
					"first_name": "Test",       
					"last_name": "Dev",     
					"phone": "+971 00000000",       
					"email": "testdev@gmail.com",       
					"address": {        
						"street_1": "street 1",     
						"street_2": "street 2",     
						"city": "madinat zayed",        
						"state": "Abudhabi",        
						"country": "AE"     
					}     
				}   
			}
		}';


		//$data = $x;
		$data = $this->input->get_post('data');
		

		$api_credentials = array(
			'user1' => 'abc123',
			'user2' => 'abcxyz'
		);
		if (!isset($_SERVER['PHP_AUTH_USER'])) {
			header('WWW-Authenticate: Basic realm="x-apikey"');
			header('HTTP/1.1 401 Unauthorized');
			exit;
		}
		else
		{
			$username = $_SERVER['PHP_AUTH_USER'];
			$password = $_SERVER['PHP_AUTH_PW'];
			if (!array_key_exists($username, $api_credentials) || $password != $api_credentials[$username]) 
			{
				//header('HTTP/1.1 403 Forbidden');
				http_response_code(204);
				exit;
			}
			else
			{
				$result = json_decode($data, true);
				$db = $this->load->database();
				$orderinfo = $result['orderInfo'];
				$customer = $orderinfo['customer'];
				$address = $customer['address'];
				if(empty($result['establishment']) ||  empty($result['discount_code']) || 
				empty($result['delivery_amount']) || empty($result['discount_amount']) || 
				empty($orderinfo['dining_option']) || empty($orderinfo['notes']) ||
				empty($customer['first_name']) || empty($customer['last_name']) ||
				empty($customer['phone']) || empty($customer['email']) ||
				empty($address['street_1']) || empty($address['city']) ||
				empty($address['state']) || empty($address['country']))
				{
					exit('{
						"status": "ERROR",
						"error": {
							"message": "No Order Items",
							"code": 204,
							"details": {
								"Invalid Data": "Empty Order Items"
							}
						}
					}');
				}
				else
				{
					foreach($result['items'] as $item) 
					{
						if(empty($item['product']) || empty($item['price']) || empty($item['quantity']) )
						{
							exit('{
								"status": "ERROR",
								"error": {
									"message": "No Order Items",
									"code": 204,
									"details": {
										"Invalid Data": "Empty Order Items"
									}
								}
							}');
						}
					}
					$idata = array(
						'establishment' => $result['establishment'],
						'discount_code' => $result['discount_code'],
						'delivery_amount' => $result['delivery_amount'],
						'discount_amount' => $result['discount_amount']
					);
					$this->db->insert('order', $idata);
					$this->db->limit(1);
					$this->db->order_by('id','desc');
					$query = $this->db->get('order');
					foreach($query->result() as $r)
					{
						$data3 = $r;
						$id =  $data3->id;
					}
					foreach($result['items'] as $item) 
					{
						$idata = array(
							'id_order' => $id,
							'product' => $item['product'],
							'price' => $item['price'],
							'quantity' => $item['quantity'],
							'special_request' => $item['special_request'],
						);
						$this->db->insert('items', $idata);
						$this->db->where('id_order = ',$id);
						$this->db->limit(1);
						$this->db->order_by('id','desc');
						$query = $this->db->get('items');
						foreach($query->result() as $r)
						{
							$data3 = $r;
							$itemid =  $data3->id;
						}
						foreach($item['modifieritems'] as $modifieritem)
						{
							if(empty($modifieritem['modifier']) || empty($modifieritem['qty']))
							{
							}
							else
							{
								$idata = array(
									'id_item' => $itemid,
									'modifier' => $modifieritem['modifier'],
									'qty' => $modifieritem['qty']
								);
								$this->db->insert('item_modifiers', $idata);
							}
						}
					}
					$idata = array(
						'id' => $id,
						'dining_option' => $orderinfo['dining_option'],
						'notes' => $orderinfo['notes']
					);
					$this->db->insert('orderinfo', $idata);
					$idata = array(
						'id' => $id,
						'first_name' => $customer['first_name'],
						'last_name' => $customer['last_name'],
						'phone' => $customer['phone'],
						'email' => $customer['email']
					);
					$this->db->insert('customer', $idata);
					$idata = array(
						'id' => $id,
						'street1' => $address['street_1'],
						'street2' => $address['street_2'],
						'city' => $address['city'],
						'state' => $address['state'],
						'country' => $address['country']
					);
					$this->db->insert('address', $idata);
					echo '{"order":'.$id.'}';
				}
			}
		}
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */