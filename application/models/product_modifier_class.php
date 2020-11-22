<?php

class product_modifier_class extends CI_Model{
    var $id = "";
    var $id_product = "";
    var $id_modifier_class = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($tid , $productid , $classid)
    {
        $query = $this->db->get_where('product_modifier_class', array('id' => $tid));
        if($query->num_rows()<1)
        {
            $this->id = $tid;
            $this->id_product = $productid;
            $this->id_modifier_class = $classid;
            $this->db->insert('product_modifier_class', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('product_modifier_class');
    }
}