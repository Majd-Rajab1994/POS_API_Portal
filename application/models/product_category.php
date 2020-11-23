<?php

class product_category extends CI_Model {
    var $pcat_id = "";
    var $name ="";
    var $sorting ="";
    var $establishment_id =1;
    var $parent_id ="";
    var $order_num ="";
    var $image ="";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data)
    {
        $query = $this->db->get_where('product_category', array('pcat_id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->pcat_id = $data['id'];
            $this->name= $data['name'];
            $this->sorting= $data['sort'];
            $this->parent_id= $data['parent_id'];  
            $this->order_num =$data['Parent_sort'];
            $this->image= $data['image'];  
            $this->db->insert('product_category', $this);
        }
        
    }
    function delete()
    {
        $this->db->empty_table('product_category');
        $this->db->query('ALTER TABLE product_category AUTO_INCREMENT = 1');
    }
}