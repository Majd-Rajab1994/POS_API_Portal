<?php

use function PHPSTORM_META\type;

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polarise_Settings extends CI_Controller{
    public function index()
    {
        $this->load->view('products_add');
    }
    public function update_products()
    {
        $url = 'https://apidev.polarispos.com/huffnpuff/web/list/';

        $ch =curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('x-apikey:7301501b-d5aa-4f7d-a849-b2098452dbba '));
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $var = curl_exec($ch);
        curl_close($ch);
        //echo $data;
        
        $data = json_decode($var,true);
        $categories = $data['data']['categories'];
        $this->load->database();
        $this->load->model('product_category');
        $this->load->model('products');
        $this->load->model('timetable');
        $this->load->model('modifier_classes');
        $this->load->model('product_modifier_class');
        $this->load->model('modifiers');
        $this->product_category->delete();
        $this->products->delete();
        $this->timetable->delete();
        $this->modifier_classes->delete();
        $this->product_modifier_class->delete();
        $this->modifiers->delete();
        foreach($categories as $category)
        {
            $this->product_category->insert($category);
            $products = $category['products'];
            foreach($products as $product)
            {
                $this->products->insert($product);
                $timetable = $product['timetable'];
                $this->timetable->insert($timetable,$product['id']);
                $modifier_classes = $product['modifier_classes'];
                foreach($modifier_classes as $modifier_class)
                {
                    $this->modifier_classes->insert($modifier_class);
                    $modifiers = $modifier_class['modifiers'];
                    foreach($modifiers as $modifier)
                    {
                        $this->modifiers->insert($modifier,$modifier_class['id'],$product['id']);
                        
                    }
                }
            }
        }
        echo $var;
        //var_dump($categories);
    }
    public function punch_order()
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

        //http req
        $url = 'https://apidev.polarispos.com/huffnpuff/web/push_order/';

        $ch =curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('x-apikey:7301501b-d5aa-4f7d-a849-b2098452dbba '));
		curl_setopt($ch,CURLOPT_POST,true);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$x);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $tempoutdata = curl_exec($ch);
        curl_close($ch);
        //
        //$tempoutdata = '{"OrderId":"3"}';
        $tempdata = $x;
        $data = json_decode($tempdata,true);
        $outdata = json_decode($tempoutdata,true);
        $this->load->database();
        $this->load->model('order');
        $this->load->model('order_items');
        //var 
        $orderId = $outdata['OrderID'];
        $items = $data['items'];
        $orderInfo = $data['orderInfo'];
        $customer = $orderInfo['customer'];
        //
        $this->order->insert($orderId,$data,$orderInfo,$customer);
        foreach($items as $item)
        {
            $this->order_items->insert($orderId,$item);
        }
        echo $tempoutdata;
        //var_dump($items);
    }
}