<?php

class categories extends CI_Model {
    var $id ="";
    var $name ="";
    var $parent_id ="";
    var $sort ="";
    var $parent_sort ="";
    var $image ="";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data)
    {
        $query = $this->db->get_where('categories', array('id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->id= $data['id'];
            $this->name= $data['name'];
            $this->parent_id= $data['parent_id'];  
            $this->sort= $data['sort'];
            $this->parent_sort= $data['Parent_sort'];  
            $this->image= $data['image'];  
            $this->db->insert('categories', $this);
        }
        
    }
    function delete()
    {
        $this->db->empty_table('categories');
    }
}