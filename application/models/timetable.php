<?php

class timetable extends CI_Model{
    var $product_id = "";
    var $active = "";
    var $from_date = "";
    var $to_date = "";
    var $timetable_data = "";
    var $type = "";
    function __construct()
    {
        parent::__construct();
    }
    function insert($data,$id1)
    {
        $query = $this->db->get_where('timetable', array('id' => $id1));
        if($query->num_rows()<1)
        {
            $this->product_id = $id1;
            $this->active = $data['active'];
            $this->from_date = $data['from_date'];
            $this->to_date = $data['to_date'];
            $this->timetable_data = $data['timetable_data'];
            $this->type = $data['type'];
            $this->db->insert('timetable', $this);
        }
    }
    function delete()
    {
        $this->db->empty_table('timetable');
        $this->db->query('ALTER TABLE timetable AUTO_INCREMENT = 1');
    }
}