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
        $this->load->model('categories');
        $this->load->model('products');
        $this->load->model('timetable');
        $this->load->model('modifier_classes');
        $this->load->model('product_modifier_class');
        $this->load->model('modifiers');
        $i = 0;
        $this->categories->delete();
        $this->products->delete();
        $this->timetable->delete();
        $this->modifier_classes->delete();
        $this->product_modifier_class->delete();
        $this->modifiers->delete();
        foreach($categories as $category)
        {
            $this->categories->insert($category);
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
                    $i++;
                    $this->product_modifier_class->insert($i,$product['id'],$modifier_class['id']);
                    $modifiers = $modifier_class['modifiers'];
                    foreach($modifiers as $modifier)
                    {
                        $this->modifiers->insert($modifier,$modifier_class['id']);
                        
                    }
                }
            }
        }
        echo $var;
        //var_dump($categories);

    }
}