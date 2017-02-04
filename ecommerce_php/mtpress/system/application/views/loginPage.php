

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>MT Press Sign in</TITLE>
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

	.footer{
		background-image: URL('http://csci4xx.usc.edu:9007/mtpress/footerline.jpg');
	}
.col1
{
	padding-top:0.4cm;
}

.col2
{
	padding-top:0.4cm;
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
	<TD width="25%"> &nbsp;
	</TD>
	 
<!-- Sign in Column -->

	<TD width = "50%">
  <!-- 
  <form name= "login"  id = "login" action = "validateLogin.jsp"  method = "POST">
	<TABLE cellpadding="10" >
	    
	    <TR>
		<Th align= left style="font-size:20px;padding-top:0.4cm"><b>Sign in</b></Th>
    </TR>
   
	<TR>
		<TD id = "logincheck" colspan = "2"> <Font color = "red" >*</font> indicates a required field</TD>
		   </TR>
    <TR >
				<TD style= "font-weight:bold;" class ="col1" > Username<Font color = "red" >*</font> &nbsp; </TD>
				<TD  width = "400" class ="col2">
				<input type="text" name="username" size = "10" maxlength ="10"> <code>(min 6 char of a-z,A-z)</code>
				</TD>
    </TR>
    <TR >
				
				<TD style= "font-weight:bold;" class ="col1"  >Password<Font color = "red" >*</font>&nbsp; </TD>
				<TD  width = "400"  class ="col2">
				<input type="password" name="password" size ='10' maxlength = "10"> <code>(6 to 8  char of a-z,A-z,0-9)
              </code>
			  	
				</TD>
    </TR>

     <TR>
		<TD  style=" text-align: left;" colspan = "2" class ="col1"><input  class="button" type="submit" value="Sign in >" onclick = "Validate()"  ></TD>
	 </TR>
       <TR>
		<TD  style=" text-align: left;" colspan = "2"><SPAN style="font-size: 14px;">Not an existing Customer? &nbsp;<a href="http://cs-server.usc.edu:9007/mtpress/customerRegister.jsp" STYLE = "text-decoration:none;">Register a account</a>
              </SPAN></TD>
	 </TR>

    </TABLE>
	</form> -->
	<?=form_open('customer/login/')?>
  <TABLE cellpadding = 3 >
  	    <TR>
		<Th align= left style="font-size:20px;padding-top:0.4cm"><b>Sign in</b></Th>
    </TR>
	
	<TR>
		<TD colspan = 2 style="color:#FF2121;font-size:13px;"><?php if($this->session->flashdata('message')) : ?>
	<?=$this->session->flashdata('message')?>
<?php endif; ?>&nbsp;</TD>
	</TR>

  <TR>
	<TD style= "font-weight:bold;"><?=form_label('Username', 'user_name')?><Font color = "red" >*</TD>
	<TD  width = "400"><?=form_input('user_name', set_value('user_name'))?><code>(min 6 of a-z,A-z)</code></TD>
  </TR>
  <TR>
	<TD colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;<?=form_error('user_name')?></TD>
	 </TR>
  <TR>
	<TD style= "font-weight:bold;">	<?=form_label('Password', 'user_pass')?><Font color = "red" >*
</TD>
	<TD width = "400"><?=form_password('user_pass')?><code>(6 to 8 of a-z,A-z,0-9)
              </code>
		
			</TD>
  </TR>
  <TR>
	<TD  colspan = 2 style="color:#FF2121;font-size:11px;">&nbsp;	<?=form_error('user_pass')?>
			</TD>
	<TD></TD>
  </TR>
    <TR>
	<TD colspan = 2><?=form_submit('login', 'Sign in >')?></TD>
	
  </TR>
         <TR>
		<TD  style=" text-align: left;" colspan = "2"><SPAN style="font-size: 14px;">Not an existing Customer? &nbsp;<a href="http://cs-server.usc.edu:4551/mtpress/index.php/guest/registration" STYLE = "text-decoration:none;">Register a account</a>
              </SPAN></TD>
	 </TR>
  
  </TABLE>
  <?=form_close();?>
 
	</TD>	

	<!-- Right  Column -->
	<TD width = "25%">&nbsp;
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
