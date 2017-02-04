<?php 
 $session_username = $this->session->userdata('session_username');?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Welcome To MT Press!</TITLE>

  <style type="text/css">
body{


  
  }
.toplinks
{
	
	    color: white;
    	font-weight:bold;
		text-decoration: underline;
}
.linkTable
{
	text-align:center;
	background-image:URL("http://csci4xx.usc.edu:9007/mtpress/toplinks.jpg");
	color: white;
    
	font-weight:bold;


}
	.listhead
	{
		
		text-align:center;
		background-image:URL('http://csci4xx.usc.edu:9007/mtpress/cathead.jpg');
		font-weight:bold;
		color:white;
	}

		.featured
	{
		text-align:center;
		background-image:URL('http://csci4xx.usc.edu:9007/mtpress/featured.jpg');
		font-weight:bold;
		color:white;
	}

	.footer{
		background-image: URL('http://csci4xx.usc.edu:9007/mtpress/footerline.jpg');
	}

	.profilelist
	{
		background-image: URL('http://csci4xx.usc.edu:9007/mtpress/profilelist.jpg');
		text-align:center;
		font-size: 15px;
		font-weight:bold;
		color:white;

	}
	.holder
	{
		padding-top:.3cm;
	}

	.profilelistholder
	{
		background-color:#F4F3F3;
		padding:1mm 3mm 1mm 3mm;
	}




  </style>
  </HEAD>

 <BODY >
 <div align="center">
<!-- Header-->
<div class="header" width= "960" >
<TABLE border ="0" >
<TR>
	<TD><img src = "http://csci4xx.usc.edu:9007/mtpress/logo.jpg"/></TD>
</TR>
</TABLE>
</div>
<!--Link Land-->

<div  width="960">
<TABLE class="linkTable" border ="0" width = "960" height="25" style="border-color:#90A7BD;">
<TR><TD  >
 <a class="toplinks" title="Home" href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/main"  STYLE = "text-decoration:none;">Home</a> &nbsp; &nbsp; &nbsp;
 
 
	</TD>
</TR>
</TABLE>
</div>

<div class = "holder">
<table  width= "960" >
<TR>
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
			<TD width = "20%">
					<!-- Title decor -->
					<!-- PRofile lister -->
					<div style="position:absolute;top:1.5in;">
					<TABLE   width = "192" >
					<TR>
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:18px;text-align:left;background-color:#F4F3F3;padding:2mm 2mm 2mm 2mm" > Your Profile</TD>
					</TR>
											
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/profileDisplay" STYLE = "text-decoration:none;">PROFILE INFORMATION</a>
              </SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/profileEdit" STYLE = "text-decoration:none;">EDIT PROFILE</a></SPAN>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/changePassword" STYLE = "text-decoration:none;">CHANGE PASSWORD</a></SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/orderHistory" STYLE = "text-decoration:none;">ORDER HISTORY</a></SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 12px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/signout" STYLE = "text-decoration:none;">SIGN OUT</a></SPAN></TD>
					</TR>

					</TABLE>
					</div>


			</TD>


<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!------------------------------------------------------------JSP-------------------------------------------------------------->
			<TD style = "padding: 3mm 10mm "width = "60%">
			<?=form_open('customer/changePassword/')?>
					
			<TABLE cellpadding = "2">
						<TH align= center colspan = 2 style="font-size:18px;padding-top:.4cm">Update Profile </TH>
						
												
						<TR>
							<TD colspan = 2 style="color:#FF2121;font-size:13px;"><?php if($this->session->flashdata('message')) : ?>
							<?=$this->session->flashdata('message')?>
							<?php endif; ?>&nbsp;</TD>
						</TR>
						
						<?php
					   
					    //$session_username = $this->session->userdata('session_username');
						$sql_fetchprofile = "SELECT * FROM customer WHERE username = ?";
    					$fetchprofile = $this->db->query($sql_fetchprofile, array($session_username)); 
						if($fetchprofile->num_rows() > 0):
						   foreach ($fetchprofile->result() as $row):
						   $fn = $row->FName;
						   $lstn = $row->LName;
						   $eid = $row->email;
						   $ph = $row->phno;
						   $addr = $row->address;
						   $st = $row->state;
						   $cty = $row->city;
						   $zp = $row->zip;
						   
						   
						?>
						
						<?php 
						$fn_data = array(
						  'name'        => 'first_name',
			              'id'          => 'first_name',
			              'value'       => $fn		              
							);
						$ln_data = array(
						  'name'        => 'last_name',
			              'id'          => 'last_name',
			              'value'       => $lstn		              
							);
						$email_data = array(
						  'name'        => 'email_id',
			              'id'          => 'email_id',
			              'value'       => $eid		              
							);
							
					    $phone_data = array(
						  'name'        => 'phone',
			              'id'          => 'phone',
			              'value'       => $ph	              
							);
						$addr_data = array(
						  'name'        => 'address',
			              'id'          => 'address',
			              'value'       => $addr,
							'maxlength'   => '100',
             				 'size'        => '50'	              
							);
							
					   	$state_data = array(
						  'name'        => 'state',
			              'id'          => 'state',
			              'value'       => $st,
							'maxlength'   => '2',
             				 'size'        => '5'	              
							);
						$city_data = array(
						  'name'        => 'city',
			              'id'          => 'city',
			              'value'       => $cty,
							'maxlength'   => '20',
             				 'size'        => '20'	              
							);
						$zip_data = array(
						  'name'        => 'zip',
			              'id'          => 'zip',
			              'value'       => $zp,
							'maxlength'   => '5',
             				 'size'        => '10'	              
							);
						 ?>
						
						
											
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Personal Information </td>
						</TR>
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2>&nbsp;</td>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('First Name', 'first_name')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($fn_data)?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('first_name')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Last Name', 'last_name')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($ln_data)?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('last_name')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Email id', 'email_id')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($email_data)?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('email_id')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Phone', 'phone')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($phone_data)?><code>&nbsp;10 digits numbers</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('phone')?>						
						</TD>
						</TR>
						
						<TR>
							<TD colspan = 2><HR/></TD>
						</TR>
						
					
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Shipping Address </td>
						</TR>	
					<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2>&nbsp;</td>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Address', 'address')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($addr_data)?><br/><span style="font-size:13px;"> Street#, street, apt# - No Special characters</span> </TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('address')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('State', 'state')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($state_data)?><code>Eg:CA,MA</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('state')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('City', 'city')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($city_data)?><code>No spaces Eg:LosAngeles</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('city')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Zip', 'zip')?><Font color = "red" >* </font></TD>
							<TD><?=form_input($zip_data)?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('zip')?>						
						</TD>
						</TR>
																
											
						<TR>
						<TD colspan = 2><?=form_submit('profileEdit', 'Update Profile >')?></TD>
						</TR>
  
  </TABLE>
					
<?php
	endforeach;
	endif;
?>				
					
<?=form_close();?>
				

			</TD>

<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
			<TD   width = "20%">

					<div style="position:absolute;top:1.5in;">
					<TABLE  cellpadding = 10 width = "192" >
					<TR>
					
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#CDF2FD;padding:2mm 0 2mm 0" ><img src="http://csci4xx.usc.edu:9007/mtpress/left_dots.gif" width="5" height="15" border="0" alt="" align =left> YOUR ACCOUNT</TD>
					</TR>
					<!------------------------------------------------------------JSP-------------------------------------------------------------->						
					<TR>
						<?php
						   
						    //$session_username = $this->session->userdata('session_username');
							$sql_fetchname = "SELECT FName, LName FROM customer WHERE username = ?";
    						$fetchname = $this->db->query($sql_fetchname, array($session_username)); 
							if($fetchname->num_rows() > 0):
							   foreach ($fetchname->result() as $row):
							?>
										
						
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;">Welcome!&nbsp;<?php echo $row->FName; ?><br/><?php echo $row->LName; ?></SPAN></TD>
              
              <?php
					endforeach;
					endif;
				?>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/profile" STYLE = "text-decoration:none;" title="Change your personal information, view your order history and address book, and manage your mailing list preferences.">Your Profile</a></SPAN>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/signout" STYLE = "text-decoration:none;">Sign Out</a></SPAN></TD>
					</TR>
					
					<TR>
						<TD>&nbsp;</TD>
					</TR>
				
				    <TR>
					<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#F0F0C6;padding:2mm 0 2mm 0" ><img src="http://csci4xx.usc.edu:9007/mtpress/cart_new.gif" width="19" height="15" border="0" alt="" align =left>SHOPPING CART</TD>
					</TR>

					<TR>
					<?php
						   
						    //$session_username = $this->session->userdata('session_username');
							$sql_fetchcart = "SELECT sum(quantity)total FROM cart WHERE username = ?";
    						$fetchcart = $this->db->query($sql_fetchcart, array($session_username)); 
							foreach ($fetchcart->result() as $row2):
							?>
					
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;font-weight:bold;color:26869E;"><?php echo $row2->total;?> item's in your Cart
              </SPAN></TD>
                            <?php
					endforeach;
				
				?>
              
                           
					</TR>

					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/cart" STYLE = "text-decoration:none;">Edit Cart</a>&nbsp;&nbsp;&nbsp;|&nbsp; &nbsp;&nbsp;<a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/checkout" STYLE = "text-decoration:none;"> Check Out</SPAN>
              </SPAN></TD>
					</TR>


					</TABLE>
					</div>

			</TD>


</TR>


</table>

</div>


<!-- Footer-->

<div>
<TABLE width="960" class = "footer">
<TR>
	<TD > </TD>
</TR>
</TABLE>
<TABLE width="960">
<TR>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/about" STYLE = "text-decoration:none;">ABOUT</a>
              </SPAN>&nbsp; | &nbsp;</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/copyright" STYLE = "text-decoration:none;">COPYRIGHT</a>
              </SPAN>&nbsp; | &nbsp;
	</TD>

	<TD WIDTH = "250">
	</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/termsofuse" STYLE = "text-decoration:none;">TERMS OF USE</a>
              </SPAN>&nbsp; | &nbsp;</TD>

	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;">COPY RIGHT @CSCI571 SUMMER-2010 </a>
              </SPAN></TD>

</TR>
</TABLE>

</div>


 
 </BODY>
</HTML>


