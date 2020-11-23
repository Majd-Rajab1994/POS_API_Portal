<?php

class order_items extends CI_Model
{
    var $order_id = "";
    var $product = "";
    var $product_name = "";
    var $quantity = "";
    var $price = "";
    var $note = "";
    var $special_request = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($orderId,$data)
    {

        $query = $this->db->get_where('order',array('order_id' => $orderId));
        $result = $query->row();
        $id = $result->id;
        $this->order_id= $id;
        $this->product = $data['product'];
        $this->product_name = null;
        $this->quantity = $data['quantity'];
        $this->price = $data['price'];
        $this->note = null;
        $this->special_request = $data['special_request'];
        $this->db->insert('order_items',$this);
    }
}