<?php

class modifier_classes extends CI_Model{
    var $id = "";
    var $modifier_class_id = "";
    var $sort = "";
    var $name = "";
    var $minimum_amount = "";
    var $maximum_amount = "";
    var $admin_modifier = "";
    var $active = "";
    var $forced = "";
    var $amount_free_is_dollars = "";
    var $amount_free = "";
    var $admin_mod_type = "";
    var $split = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data)
    {
        $query = $this->db->get_where('modifier_classes', array('id' => $data['id']));
        if($query->num_rows()<1)
        {
            $this->id = $data['id'];
            $this->modifier_class_id = $data['modifier_class_id'];
            $this->sort = $data['sort'];
            $this->name = $data['name'];
            $this->minimum_amount = $data['minimum_amount'];
            $this->maximum_amount = $data['maximum_amount'];
            $this->admin_modifier = $data['admin_modifier'];
            $this->active = $data['active true'];
            $this->forced = $data['forced'];
            $this->amount_free_is_dollars = $data['amount_free_is_dollars'];
            $this->amount_free = $data['amount_free'];
            $this->admin_mod_type = $data['admin_mod_key'];
            $this->split = $data['split'];
            $this->db->insert('modifier_classes', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('modifier_classes');
    }
}