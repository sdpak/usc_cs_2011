<?php

class Customer extends Controller {
	
	function Customer()
	{
		parent::Controller();	
	}
	
	function login()
			{
				// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
						
				// SET VALIDATION RULES
				//$this->form_validation->set_rules('user_name', 'username', 'required');
				//$this->form_validation->set_rules('user_pass', 'password', 'required');
				$this->form_validation->set_rules('user_name', 'Username', 'required|min_length[6]|alpha');
				$this->form_validation->set_rules('user_pass', 'Password', 'required|min_length[6]|max_length[8]|alpha_numeric');
				
				$this->form_validation->set_error_delimiters('<em>','</em>');
				
				// has the form been submitted and with valid form info (not empty values)
				if($this->input->post('login'))
				{
					if($this->form_validation->run())
					{
						$user_name = $this->input->post('user_name');
						$user_pass = $this->input->post('user_pass');
						$sql = "SELECT * FROM user WHERE empid = ? AND pwd = ?";
						
						$fetchdata = $this->db->query($sql, array($user_name, $user_pass)); 
						
						if ($fetchdata->num_rows() > 0)
							{
							foreach ($fetchdata->result() as $row)
									{
									   if(($row->empid == $user_name)&&($row->pwd == $user_pass))
									   {
									   //$this->session->set_flashdata('message', 'User information Available'); 
									   // Create the session for this user
									   $this->session->set_userdata('session_username',$user_name);
									  								   
									   //Redirect to the next page
									   redirect('customer/main/');
									   }
									 
									   
									 }
							}
							else
							{  
						    $this->session->set_flashdata('message', 'Incorrect login information. Please login again...');
							redirect('customer/login/');
							}
					} 
								
				}
				
				
				
				$this->load->view('loginPage');
			
			}
	
/*	function loginPass()
			{
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
				
			if($this->session->userdata('session_username'))
				{
				$session_username = $this->session->userdata('session_username');
				$this->load->view('loginPassPage.php');
							
				}
			else
				{
				$this->session->set_flashdata('message', 'Session Expired. Please Sign in again...');			
				$this->load->view('loginPage.php');
				}
			
			}*/

			
// USER Profile information------------------------------------------------
	function profile()
	{
	
	// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
	
	// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
		
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	   
		
    $this->load->view('profileDisplay');
	
	}
	
	function profileDisplay()
	{
		// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
	
	// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
   
		
    $this->load->view('profileDisplayPage');
	}
	
function profileEdit()
{	
		 

	//$session_username = 'deepak';
// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
	
	// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
	

	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
					
			// SET VALIDATION RULES
	$sql = "SELECT * FROM user WHERE empid = ?";
	$fetchdata = $this->db->query($sql, array($session_username));
	foreach ($fetchdata->result() as $row)
	{
	$user_name = $row->empid; 
	$user_pass = $row->pwd; 
	}
	
	

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
			if($this->input->post('profileEdit'))
				{
					if($this->form_validation->run())
					{
						
							$first_name = $this->input->post('first_name');
							$last_name = $this->input->post('last_name');
							$email_id = $this->input->post('email_id');
							$phone = $this->input->post('phone');
							$address = $this->input->post('address');
							$state = $this->input->post('state');
							$city = $this->input->post('city');
							$zip = $this->input->post('zip');
							
						
							$sql_customer_remove ="delete from customer where username = ?";
							$sql_customer_insert = "INSERT INTO customer values(?,?,?,?,?,?,?,?,?,?,?)";
											
							$this->db->query($sql_customer_remove, array($session_username));
							
							$this->db->query($sql_customer_insert, array($user_name,$user_pass,$first_name,$last_name,$address,$city,$state,'USA',$zip,$phone,$email_id));
													
							redirect('customer/profileDisplay');
																						
							
							
							
					}
							
				} 
			
				$this->load->view('profileEditPage');
		
		
		}
	   
	//Changing password in profile page
	function changePassword()
	{
			
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
				
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
				
		    $this->form_validation->set_rules('user_pass', 'Current Password', 'required|min_length[6]|max_length[8]|alpha_numeric');
		    $this->form_validation->set_rules('user_pass1', 'New Password', 'required|min_length[6]|max_length[8]|alpha_numeric|matches[user_pass2]');
		    $this->form_validation->set_rules('user_pass2', 'Verify Password', 'required');
		    
		    if($this->input->post('changePassword'))
				{
					if($this->form_validation->run())
					{
						$user_pass = $this->input->post('user_pass');
						$user_pass1 = $this->input->post('user_pass1');
						$user_pass2 = $this->input->post('user_pass2');
						
						$sql = "SELECT * FROM user WHERE empid = ? AND pwd = ?";
						
						$fetchdata = $this->db->query($sql, array($session_username, $user_pass)); 
						
						if ($fetchdata->num_rows() > 0)
						{
						
						$sql_user_remove ="delete from user where empid = ?";
						$sql_user_insert = "INSERT INTO user values(?,?,?)";
														
						$this->db->query($sql_user_remove, array($session_username));
							
						$this->db->query($sql_user_insert, array($session_username,$user_pass1,'Customer'));
						$this->session->set_flashdata('message', 'Password Changed Successfully. Please login again...');
						redirect('customer/login');
							
						}
						
						else{
						
						$this->session->set_flashdata('message', 'Invalid current Password. Please login again...');
											
						redirect('customer/changePassword');
						}
			
					}
				
		
			}

			$this->load->view('changePasswordPage');
	}
//END of user PRofile information

// Main Page

	function main()
	{
				//$session_username = 'deepak';
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
				
			
				
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
			$this->load->view('customerMainPage');
	
				
				
// main function ends				
	
	}
	 function categoryDisplay()
	 {
	// $session_username = 'deepak';
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
				
			
				
		if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
			$this->load->view('customerCategoryDisplayPage');
	
				
				
	//  function ends				
	 
	
	 
	 }	
	 
	 function addToCart()
	 {
	 //$session_username = 'deepak';
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
				
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
			
				$bookid = $this->input->post('bookid');
				$bookname = $this->input->post('bookname');
				$bookavailability = $this->input->post('availability');
				$bookprice = $this->input->post('bookprice');
				
				if($bookavailability>0)
				{
				$sql_cartcheck = "select * from cart where username = ? and productid =?";
				$cartcheck = $this->db->query($sql_cartcheck, array($session_username,$bookid));
				if ($cartcheck->num_rows()> 0)
				{
				$sql_updatecart = "update cart set quantity = quantity+1 where username =? and productid= ?";
				$cartcheck = $this->db->query($sql_updatecart, array($session_username,$bookid));
				$this->load->view('customerMainPage'); 
												
				}

				else
				{
				
				$sql_addcart = "Insert into cart Values (?, ?, ?, ?, ?, ?)";
				 $this->db->query($sql_addcart, array($session_username,$bookid,$bookname,'1',$bookprice,$bookprice));
				 $this->load->view('customerMainPage');
				} 				  
				}
				else
				{
				
				$this->session->set_flashdata('info', 'Sorry, this book is out of stock');
				$this->load->view('categoryDisplayPage');
				
				}
				
	
				
	//  function ends				
	 
	
	 
	 }

	function cart()
	{
	//$session_username = 'deepak';
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
				
						
	   
	    //$session_username = $this->session->userdata('session_username');
		$sql_fetchcart = "SELECT * FROM cart WHERE username = ?";
    	$fetchcart = $this->db->query($sql_fetchcart, array($session_username)); 
		if($fetchcart->num_rows()==0)
		{
		$this->load->view('customerCartEmptyPage');
		}
		
		else{
			$this->load->view('customerCartPage');
		}				
				

	
	
		//  function ends	
	}
	
	function cartUpdate()
	{
	//$session_username = 'deepak';
			// LOAD LIBRARIES
				$this->load->library(array('form_validation', 'session'));
				
				// LOAD HELPERS
				$this->load->helper(array('form', 'url'));
		if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');

				$operation = $this->input->post('operate');
				$bookid = $this->input->post('bookid');
				$quantity = $this->input->post($bookid);
				
				//echo $operation;
				//echo "Write code for update cart";
				//echo $bookid;
				//echo $quantity;
				
				
				if($operation==1&&$quantity!=0)
				{

				  $sql_updatecart = "update cart set quantity = ? where username = ? and productid= ?";
				  $this->db->query($sql_updatecart, array($quantity,$session_username,$bookid));		  
				$this->load->view('customerCartPage');	
				
				}
				 
				elseif($operation == 2)
				{
				$sql_deletecart = "delete from cart where username = ? and productid= ?";
				$this->db->query($sql_deletecart, array($session_username,$bookid));
				
					$sql_fetchcart = "SELECT * FROM cart WHERE username = ?";
			    	$fetchcart = $this->db->query($sql_fetchcart, array($session_username)); 
					if($fetchcart->num_rows()==0)
					{
					$this->load->view('customerCartEmptyPage');
					}
					
					else{
						$this->load->view('customerCartPage');
					}
				
				}
				elseif($operation ==3)
				{
				$sql_emptycart = "delete from cart where username = ?";
				$this->db->query($sql_emptycart, array($session_username));
				
				$this->load->view('customerCartEmptyPage');
				}
				
				else
				{
				
				$this->session->set_flashdata('message', 'Your Cart is empty. Please add books to cart to continue');
				redirect('cart');
				}
	
		//  function ends	
	}

		function checkout(){
		//$session_username = 'deepak';
		// LOAD LIBRARIES
		$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
		$this->load->helper(array('form', 'url'));
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
		
		$sql_fetchcart = "SELECT * FROM cart WHERE username = ?";
    	$fetchcart = $this->db->query($sql_fetchcart, array($session_username)); 
		if($fetchcart->num_rows()==0)
		{
		$this->load->view('customerCartEmptyPage');
		}
		
		else{
			$this->load->view('customerCheckoutPage');
		}
		
		
	//  function ends		
	}
	
	
	function payment()
	{
		//$session_username = 'deepak';
		// LOAD LIBRARIES
		$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
		$this->load->helper(array('form', 'url'));
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
	//Validate Fields
	$this->form_validation->set_rules('cardType', 'Card Type', 'required');
	$this->form_validation->set_rules('cdno', 'Card No', 'required|max_length[16]|min_length[16]|numeric');
	$this->form_validation->set_rules('cvv', 'CVV Code', 'required|max_length[4]|min_length[3]|numeric');
	$this->form_validation->set_error_delimiters('<em>','</em>');
	
	if($this->input->post('payment'))
				{
					if($this->form_validation->run())
					{
					$cardtype = $this->input->post('cardType');
					$cardno = $this->input->post('cdno');
					$cardcvv = $this->input->post('cvv');
					
					// insert into ordergen to produce order id
					$sql_ordergen = "Insert Into ordergen (username) values(?)";
					$this->db->query($sql_ordergen, array($session_username)); 
					
					// obtain max of order id
					$sql_ordermax = "Select max(orderid)orderidmax from ordergen where username = ?";
					$ordermax = $this->db->query($sql_ordermax, array($session_username));
						   foreach ($ordermax->result() as $row){
						   $orderid = $row->orderidmax;
						   } 
					
					//calculate order price
					$sql_orderprice = "select sum(actualprice*quantity)total from cart where username = ?";
					$orderprice = $this->db->query($sql_orderprice, array($session_username));
							foreach ($orderprice->result() as $row1){
						    $ordertotal = $row1->total;
						   } 
					
					//insert into order detail
					$sql_insertorder="insert into orderdetail(username,productid,productname,quantity,actualprice,orderid,orderprice,orderdate) select username,productid,productname,quantity,actualprice,?,?,sysdate() from cart where username = ?";
					$this->db->query($sql_insertorder, array($orderid,$ordertotal,$session_username));
					//insertinto order pay
					
					$sql_orderpay = "Insert into orderpay Values (?,?,?,?)";
					$this->db->query($sql_orderpay, array($orderid,$cardno,$cardtype,$cardcvv));
					
					//delete from cart
					
					$sql_delete = "Delete from cart where username = ?";
					$this->db->query($sql_delete, array($session_username));
					redirect('customer/ordersummary/');					
					
					}
					
					
				}
	
	
	
	
	$this->load->view('customerPaymentPage');	
		
		//  function ends
	
	}
	
	function ordersummary()
	{
	//$session_username = 'deepak';
		// LOAD LIBRARIES
		$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
		$this->load->helper(array('form', 'url'));	
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	$this->load->view('customerOrderSummary');
	//  function ends
	}
	
	function orderHistory()
	{
	//$session_username = 'deepak';
		// LOAD LIBRARIES
		$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
		$this->load->helper(array('form', 'url'));	
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
	$this->load->view('customerOrderHistory');
	//  function ends
	}
	
	function orderSum()
	{
	
	//$session_username = 'deepak';
		// LOAD LIBRARIES
		$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
		$this->load->helper(array('form', 'url'));	
	if(!$this->session->userdata('session_username'))
	{
	$this->session->set_flashdata('message', 'User Session Expired. Please login again...');
	redirect('customer/login/');
				
	}
	$session_username=$this->session->userdata('session_username');
	
	$this->load->view('customerOrderSum');
	//  function ends
	}
	
	function signout()
	{
		// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
	$this->load->helper(array('form', 'url'));	
	$this->session->unset_userdata('session_username');
	redirect('customer/login/');
	}
	
	function copyright()
	{
			// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
	if($this->session->userdata('session_username'))
	{

	$this->load->view('customerCopyrightPage');
				
	}
	else{	
	
	$this->load->view('copyrightPage');
	}
	}
	
	function about()
	{
			// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
	if($this->session->userdata('session_username'))
	{
	
	$this->load->view('customerAboutPage');
				
	}
	else{	
	
	$this->load->view('aboutPage');
	}
	}
	
	function termsofuse()
	{
			// LOAD LIBRARIES
	$this->load->library(array('form_validation', 'session'));
				
		// LOAD HELPERS
	$this->load->helper(array('form', 'url'));
	if($this->session->userdata('session_username'))
	{

	$this->load->view('customerTermsPage');
				
	}
	else{	
	
	$this->load->view('termsPage');
	}
	}
	
//customer Function ends
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */