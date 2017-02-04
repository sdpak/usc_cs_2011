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
			<div style="position:absolute;top:1.5in;">

			<TABLE align = center width = "182"   >
		    <TR>
				<TD STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:center;background-color:D9F5C7;padding:1mm 2mm 1mm 2mm" height= "20">SELECT CATEGORY</TD>
		    </TR>
    
	         <form name= "categoryform" action = "http://cs-server.usc.edu:4551/mtpress/index.php/customer/categoryDisplay" Method =POST>
	         <input type="hidden" name = "category_id" value = ""/>

		<?php
	   
	    //$session_username = $this->session->userdata('session_username');
		$sql_fetchcategory = "SELECT distinct(productCategory) FROM product order by productCategory";
    	$fetchcategory = $this->db->query($sql_fetchcategory); 
		if($fetchcategory->num_rows() > 0):
		   foreach ($fetchcategory->result() as $row):
		?>
				
				<TR>
				<TD>
				
				<input  align = left class="button" type="submit" value='<?echo $row->productCategory;?>'  
				onClick="javascipt:document.categoryform.category_id.value='<?=$row->productCategory?>';"
				style= "width:182;background-color:F3F3F3;font-size:15px;color:3570F4;Font-weight:bold;border-style:none;text-align:left;"> 
                    
					  
				</TD>
				</TR>
                
		<?php
		endforeach;
		endif;
		?>                

                        
			</form>
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
			<TD style = "padding: 4.2mm 2mm " width = "60%">
	
			<div >
			
			<TABLE  align = center  width = "550"  >
		    <?php $category = $this->input->post('category_id');?>
		    <TR>
			<TD STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#D0D0D0;padding:1mm 2mm 1mm 2mm" height= "20" >Category : <?php echo $category;?></TD>
		    </TR>
			<TR>
			<TD colspan = 2 style="color:#FF2121;font-size:13px;"><?php if($this->session->flashdata('info')) : ?>
			<?=$this->session->flashdata('info')?>
			<?php endif; ?>&nbsp;</TD>
			</TR>
			
			 <form name = "displaybook" action = "http://cs-server.usc.edu:4551/mtpress/index.php/customer/addToCart" method = POST>
			 <input type="hidden" name = "bookid" value  = "" />
			 <input type="hidden" name = "bookname" value  = "" />
			 <input type="hidden" name = "bookprice" value  = "" />
			 <input type="hidden" name = "availability" value  = "" />
					
			<?php 
			$sql_products = "SELECT * FROM product where productCategory = ?";
			    $fetchproducts = $this->db->query($sql_products,array($category)); 
			if($fetchproducts->num_rows() > 0):
			   foreach ($fetchproducts->result() as $rows):
			?>
			<TR>
			<TD >
			<Table width = "550" >
			<TR>
				<TD width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Book ID:</span>
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <?echo $rows->productId;?> </SPAN>
                       </TD>
				<TD>&nbsp;</TD>
			</TR>
			<TR>
				<TD  width = "70%"  style= "padding:1mm 3mm 1mm 3mm;">
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Name:</span>
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"><?echo $rows->productName;?> </SPAN>
				</TD>
				<TD>&nbsp;</TD>
			</TR>
			<TR>
				<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Description:</span>
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <?echo $rows->productDescription;?>  </SPAN>
				</TD>
				<TD style="text-align:center;"><input type="submit"  value="Add to Cart " 
				onclick ="javascipt:document.displaybook.bookname.value='<?=$rows->productName?>';
                document.displaybook.bookid.value='<?=$rows->productId?>';
                document.displaybook.availability.value='<?=$rows->currentAvilability?>';
                document.displaybook.bookprice.value='<?=$rows->actualPrice?>';"/>
				
				</TD>
			</TR>
			<TR>
				<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Price:</span>
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:4DAA27;"> $<?echo $rows->actualPrice;?></SPAN>
				</TD>
				<TD>&nbsp;</TD>
			</TR>
				<TR>
				<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Availability:</span>
				<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:735767;"> <?echo $rows->currentAvilability;?> </SPAN>
				</TD>
				<TD>&nbsp;</TD>
			</TR>



			</Table>
			<HR/>
 <?php
endforeach;
endif;
?>

	</form>


    </TABLE>

	</div>
	<br/><br/><br/><br/><br/><br/>

	
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


