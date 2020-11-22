<?php

class products extends CI_Model{
    var $id = "";
    var $sort = "";
    var $sku = "";
    var $id_category = "";
    var $name = "";
    var $description = "";
    var $images = "";
    var $stock_amount = "";
    var $price = "";
    var $uom = "";
    var $cost = "";
    var $sold_by_weight = "";
    var $attribute_type = "";
    var $is_shipping = "";
    var $is_gift = "";
    var $has_upsell = "";
    var $max_price = "";
    var $size_chart = "";
    var $point_value = "";
    var $course_number = "";
    var $created_date = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data)
    {
        $query = $this->db->get_where('products', array('id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->id = $data['id'];
            $this->sort = $data['sort'];
            $this->sku = $data['sku'];
            $this->id_category = $data['id_category'];
            $this->name = $data['name'];
            $this->description = $data['description'];
            $this->images = $data['images'];
            $this->stock_amount = $data['stock_amount'];
            $this->price = $data['price'];
            $this->uom = $data['uom'];
            $this->cost = $data['cost'];
            $this->sold_by_weight = $data['sold_by_weight'];
            $this->attribute_type = $data['attribute_type'];
            $this->is_shipping = $data['is_shipping'];
            $this->is_gift = $data['is_gift'];
            $this->has_upsell = $data['has_upsell'];
            $this->max_price = $data['max_price'];
            $this->size_chart = $data['size_chart'];
            $this->point_value = $data['point_value'];
            $this->course_number = $data['course_number'];
            $this->created_date = $data['created_date'];
            $this->db->insert('products', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('products');
    }
}