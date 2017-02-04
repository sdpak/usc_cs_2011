<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Create a Profile - The MT Press</TITLE>
  <style type="text/css">
body{
  background-color: FFF;
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

	.footer
	{
		background-image: URL('http://csci4xx.usc.edu:9007/mtpress/footerline.jpg');
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
<a class="toplinks" title="Home" href="http://cs-server.usc.edu:4551/mtpress/index.php/guest/main"  STYLE = "text-decoration:none;">Home</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
 <a class="toplinks" title="Create Account" href="http://cs-server.usc.edu:4551/mtpress/index.php/guest/registration" STYLE = "text-decoration:none;">Register</a> &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp;
 <a class="toplinks" title="Create Account" href="http://cs-server.usc.edu:4551/mtpress/index.php/customer/login" STYLE = "text-decoration:none;">Sign In</a>
  
	</TD>
</TR>
</TABLE>
</div>

<div>
<table width= "960" >
<TR>
	<!-- Left Column -->
	<TD width="20%"> &nbsp;
	</TD>
	 
<!-- Create Profile Form -->

<TD style = "padding: 3mm 10mm "  width = "60%">
					
<?=form_open('guest/registration/')?>
					
	<TABLE cellpadding = "2">
						<TH align= center colspan = 2 style="font-size:18px;padding-top:.4cm">Register </TH>
						
						<TR>
							<TD  style = "padding-top:.1;"colspan= '2'>  
							<SPAN style="font-size: 13px;">Fill in the fields below to create a profile. This profile is used to manage your preferences at this site only</span></TD>
						</TR>
						
						<TR>
							<TD colspan = 2 style="color:#FF2121;font-size:13px;"><?php if($this->session->flashdata('message')) : ?>
							<?=$this->session->flashdata('message')?>
							<?php endif; ?>&nbsp;</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Username', 'user_name')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('user_name', set_value('user_name'))?> <code>(min 6 char of a-z,A-z)
                         </code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('user_name')?>						
						</TD>
						</TR>
						
					
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Password', 'user_pass1')?><Font color = "red" >* </font></TD>
							<TD><?=form_password('user_pass1')?><code>(6 to 8 of a-z,A-z,0-9)</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('user_pass1')?>						
						</TD>
						</TR>
						
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Verify Password', 'user_pass2')?><Font color = "red" >*</font></TD>
							<TD><?=form_password('user_pass2')?></TD>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('user_pass1')?>						
						</TD>
						</TR>
						
						<tr>			
							<TD colspan=2> <HR/></TD>
						</TR>
						
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Personal Information </td>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('First Name', 'first_name')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('first_name', set_value('first_name'))?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('first_name')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Last Name', 'last_name')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('last_name', set_value('last_name'))?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('last_name')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Email id', 'email_id')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('email_id', set_value('email_id'))?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('email_id')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Phone', 'phone')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('phone', set_value('phone'))?><code>&nbsp;10 digits numbers</code></TD>
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
							<TD width="120" style="font-size:15px"><?=form_label('Address', 'address')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('address', set_value('address'))?><code>No Special characters</code><br/><span style="font-size:13px;"> Street#, street, apt#</span> </TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('address')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('State', 'state')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('state', set_value('state'))?><code>Eg:CA,MA</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('state')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('City', 'city')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('city', set_value('city'))?><code>No spaces Eg:LosAngeles</code></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('city')?>						
						</TD>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><?=form_label('Zip', 'zip')?><Font color = "red" >* </font></TD>
							<TD><?=form_input('zip', set_value('zip'))?></TD>
						</TR>
						
						<TR>
						<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('zip')?>						
						</TD>
						</TR>
																
											
						<TR>
						<TD colspan = 2><?=form_submit('registration', 'Create Account >')?></TD>
						</TR>
  
  </TABLE>
					
					
					
<?=form_close();?>
					
										
					
					
						<!--<form name = "createform"method ="Post" action ="customerCreateValid.jsp">
						<TABLE cellpadding = "5">
						<TH align= center colspan = 2 style="font-size:18px;padding-top:.4cm">Register </TH>
						
						<TR>
							<TD  style = "padding-top:.1;"colspan= '2'>  <SPAN style="font-size: 13px;">Fill in the fields below to create a profile. This profile is used to manage your preferences at this site only</span></TD>
						</TR>
						<TR>
							<TD align= center colspan= '2' id = "checkfield">  <Font color = "red" style="font-size:15px">*</font> indicates a mandatory field</TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Username</b><Font color = "red" >* </font></TD>
							<TD><input type="text" name="username" size = "10" maxlength ="10"> <code>&nbsp;(min 6 char of a-z,A-z)
                         </code></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Password</b><Font color = "red" >* </font></TD>
							<TD> <input type="password" name="password1" size ='10' maxlength = "10"><code>&nbsp;(min 6 max 8 char of a-z,A-z,,0-9)
							</code></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Verify Password</b><Font color = "red" >*</font></TD>
							<TD><input type="password" name="password2" size ='10' maxlength = "10">	</TD>
								<tr>			
							<TD colspan=2> <HR/></TD>
						</TR>
					
					
					
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Personal Information </td>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><b>First Name</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Fname" value ="" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Last Name</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Lname" maxlength = "50" value ="" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Email id</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="email"  maxlength = "50" value ="" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Phone </b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="phno"   maxlength = "10" size = "10"  value ="" /><code>&nbsp;10 digits numbers</code></TD>
						</TR>
						
						<TR>
							<TD colspan = 2><HR/></TD>
						</TR>
					
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Shipping Address </td>
						</TR>	
					
						<TR>
							<TD width="120" style="font-size:15px"><b>Address </b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Address" maxlength = "50" size = "43" value ="" /><br/><span style="font-size:13px;"> Street#, street, apt#</span> </TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>State/City/Zip</b><Font color = "red" >* </font></TD>
							<TD> <select name="country" id = "country" onchange = "selectChange1()">
							<option value="1" selected="selected" >Select State</option>
							<option value="CA">CA</option>
							<option value="FL">FL</option>
							<option value="MA">MA</option>
							<option value="CH">CH</option>
							<option value="Others">Others</option>
							</select>
							<select name="state" id = "state" onchange = "selectChange2()">
							<option value="1" selected="selected" >Select City</option>
							</select>

							<select name="city" id = "city">
							<option value="1" selected="selected" >Select Zip</option>
							</select>    
				         </TD>
						</TR>
						<TR>
						<TD>&nbsp;
						</TD>
						</TR>
						
						
						

						<TR>
							<TD  colspan = "2"> <input type="button" class= "submit"  value="Create Profile >" onclick="Validate()" ></TD>
						</TR>
						

						</TABLE>
						</form>

                  -->

</TD>	

<!-- End of Create Profile Form -->

	<!-- Right  Column -->
	<TD width = "20%">&nbsp;
	</TD>
</TR>	
							

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
