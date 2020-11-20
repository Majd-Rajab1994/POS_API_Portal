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
			header('WWW-Authenticate: Basic realm="My API"');
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */