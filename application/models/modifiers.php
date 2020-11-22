<?php

class modifiers extends CI_Model{
    var $id = "";
    var $id_modifier_class = "";
    var $sku = "";
    var $sort = "";
    var $name = "";
    var $price = "";
    var $barcode = "";
    var $cost = "";
    var $active = "";
    var $selected = "";
    var $is_quick = "";
    var $img_url = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data,$classid)
    {
        $query = $this->db->get_where('modifiers', array('id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->id = $data['id'];
            $this->id_modifier_class = $classid;
            $this->sku = $data['sku'];
            $this->sort = $data['sort'];
            $this->name = $data['name'];
            $this->price = $data['price'];
            $this->barcode = $data['barcode'];
            $this->cost = $data['cost'];
            $this->active = $data['active'];
            $this->selected = $data['selected'];
            $this->is_quick = $data['is_quick'];
            $this->img_url = $data['img_url'];
            $this->db->insert('modifiers', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('modifiers');
    }
}