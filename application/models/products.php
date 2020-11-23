<?php

class products extends CI_Model{
    var $product_id ="";
    var $category_id = "";
    var $name = "";
    var $price = "";
    var $cost = "";
    var $barcode ="";
    var $description = "";
    var $image = "";
    var $sort = "";
    var $sku = "";
    var $stock_amount = "";
    var $uom = "";
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
        $query = $this->db->get_where('product_category',array('pcat_id' => $data['id_category']));
        $result = $query->row();
        $id = $result->id;
        $query = $this->db->get_where('products', array('product_id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->product_id = $data['id'];
            $this->category_id = $id;
            $this->name = $data['name'];
            $this->price = $data['price'];
            $this->cost = $data['cost'];
            $this->barcode = "";
            $this->description = $data['description'];
            $this->image = $data['images'];
            $this->sort = $data['sort'];
            $this->sku = $data['sku'];
            $this->stock_amount = $data['stock_amount'];
            $this->uom = $data['uom'];
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
        $this->db->query('ALTER TABLE products AUTO_INCREMENT = 1');
    }
}