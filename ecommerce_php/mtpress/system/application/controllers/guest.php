<?php

class Guest extends Controller {
	
	function Guest()
		{
			parent::Controller();	
		}
	
	function registration()
		{
		
			// LOAD LIBRARIES
			$this->load->library(array('form_validation', 'session'));
			
			// LOAD HELPERS
			$this->load->helper(array('form', 'url'));
					
			// SET VALIDATION RULES
	
			$this->form_validation->set_rules('user_name', 'Username', 'required|min_length[6]|alpha');
			$this->form_validation->set_rules('user_pass1', 'Password', 'required|min_length[6]|max_length[8]|alpha_numeric|matches[user_pass2]');
			$this->form_validation->set_rules('user_pass2', 'Verify Password', 'required');
			$this->form_validation->set_rules('first_name', 'First Name', 'required|max_length[20]|alpha');
			$this->form_validation->set_rules('last_name', 'Last Name', 'required|max_length[20]|alpha');
			$this->form_validation->set_rules('email_id', 'Email id', 'required|valid_email');
			$this->form_validation->set_rules('phone', 'Phone', 'required|numeric|is_natural');
			$this->form_validation->set_rules('address', 'Address', 'required|max_length[50]|alphanumeric');
			$this->form_validation->set_rules('state', 'State', 'required|max_length[2]|alpha');
			$this->form_validation->set_rules('city', 'City', 'required|max_length[20]|alpha');
			$this->form_validation->set_rules('zip', 'Zip', 'required|max_length[5]|numeric|is_natural');
						
			$this->form_validation->set_error_delimiters('<em>','</em>');
			
			// has the form been submitted and with valid form info (not empty values)
			if($this->input->post('registration'))
				{
					if($this->form_validation->run())
					{
						$user_name = $this->input->post('user_name');
						$user_pass1 = $this->input->post('user_pass1');
						
						$sql = "SELECT * FROM user WHERE empid = ?";
						
						$fetchdata = $this->db->query($sql, array($user_name)); 
						
						if ($fetchdata->num_rows()> 0)
							{
							  $this->session->set_flashdata('message', 'Username already exists. Please choose a different username.');	
							 redirect('guest/registration/');	
							  
							}
							
							else{
							$first_name = $this->input->post('first_name');
							$last_name = $this->input->post('last_name');
							$email_id = $this->input->post('email_id');
							$phone = $this->input->post('phone');
							$address = $this->input->post('address');
							$state = $this->input->post('state');
							$city = $this->input->post('city');
							$zip = $this->input->post('zip');
							
							$sql_user_insert = "INSERT INTO user values(?,?,'Customer')";
							$sql_customer_insert = "INSERT INTO customer values(?,?,?,?,?,?,?,?,?,?,?)";
													
							$this->db->query($sql_user_insert, array($user_name,$user_pass1));
							
							$this->db->query($sql_customer_insert, array($user_name,$user_pass1,$first_name,$last_name,$address,$city,$state,'USA',$zip,$phone,$email_id));
							
							$this->session->set_flashdata('message', 'Account created Successfully. Please Sign in to proceed ');
							
							redirect('customer/login/');
																						
							
							}
							
					}
							
				} 
			
			
			$this->load->view('registrationPage');	
		
		}
		
		function main()
		
		{
		$this->load->view('guestMainPage');
		
		}
		
		function categoryDisplay()
		{
		$this->load->view('guestCategoryDisplay');
		
		}
	
}

?>