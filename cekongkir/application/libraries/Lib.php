<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lib {
	protected $_ci;
	
	public function __construct()
	{
		$this->_ci =&get_instance();
	}

	public function template($content, $data=null)
	{
		$data['_content'] = $this->_ci->load->view($content, $data, true);
		$this->_ci->load->view('template.php', $data);
	}
}