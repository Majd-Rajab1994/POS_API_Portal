<?php

class modifiers extends CI_Model{
    var $Prod_mod_id = "";
    var $prod_mod_class_id = "";
    var $establishment_id = 1;
    var $modifier_id ="";
    var $name = "";
    var $sort = "";
    var $sku = "";
    var $barcode = "";
    var $active = "";
    var $price = "";
    var $default_modifier = 0;
    var $cost = "";
    var $selected = "";
    var $is_quick = "";
    var $img_url = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data,$classid,$productid)
    {
        $query = $this->db->get_where('products',array('product_id' => $productid));
        $result = $query->row();
        $prod_id = $result->id;
        $query = $this->db->get_where('modifiers', array('id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->Prod_mod_id = $prod_id;
            $this->prod_mod_class_id = $classid;
            $this->modifier_id = $data['id'];
            $this->name = $data['name'];
            $this->sort = $data['sort'];
            $this->sku = $data['sku'];
            $this->barcode = $data['barcode'];
            $this->active = $data['active'];
            $this->price = $data['price'];
            $this->default_modifier = 0;
            $this->cost = $data['cost'];
            $this->selected = $data['selected'];
            $this->is_quick = $data['is_quick'];
            $this->img_url = $data['img_url'];
            $this->db->insert('modifiers', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('modifiers');
        $this->db->query('ALTER TABLE modifiers AUTO_INCREMENT = 1');
    }
}