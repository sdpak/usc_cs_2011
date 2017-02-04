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
			<?php
						   
						   
							$sql_fetchname = "SELECT FName, LName FROM customer WHERE username = ?";
    						$fetchname = $this->db->query($sql_fetchname, array($session_username)); 
							if($fetchname->num_rows() > 0):
							   foreach ($fetchname->result() as $row):
							?>
			<p style="font-weight:bold;font-size: 20px;">Welcome, <?php echo $row->FName; ?>&nbsp;<?php echo $row->LName; ?> </p> 
               <?php
					endforeach;
					endif;
				?>
<p style: >This page gives you access to your profile on this site. </p> 
<p>You can use it to:
<ul> 
<li> Change your Name.
<li> Change your Email and Phone.
<li> Change your Shipping Address.
<li> Change your password.
<li> View your order history for orders placed via this site.
</ul><br/><br/><br/></p> 

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


