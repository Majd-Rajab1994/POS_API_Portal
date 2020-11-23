<?php

class order extends CI_Model
{
    var $order_id = "";
    var $establishment ="";
    var $dining_option ="";
    var $customer_id ="";
    var $sourceId ="";
    var $totalPrice = "";
    var $employee = null;
    var $status ="";
    var $dispatched_time ="";
    var $additionalNote = "";
    var $discount_code ="";
    var $delivery_amount ="";
    var $discount_amount = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($orderId,$data,$orderInfo,$customer)
    {
        $query = $this->db->get_where('order', array('order_id' => $orderId));
        if($query->num_rows()<1)
        {
            $this->order_id = $orderId;
            $this->establishment = $data['establishment'];
            $this->dining_option = $orderInfo['dining_option'];
            $this->customer_id = null;
            $this->sourceId = null;
            $this->totalPrice = null;
            $this->employee = null;
            $this->status = null;
            $this->dispatched_time = null;
            $this->additionalNote = $orderInfo['notes'];
            $this->discount_code = $data['discount_code'];
            $this->delivery_amount = $data["delivery_amount"];
            $this->discount_amount = $data["discount_amount"];
            $this->db->insert('order',$this);
        }
    }

}