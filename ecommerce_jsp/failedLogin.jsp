<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>MT Press Sign in</TITLE>
<script type ="text/javascript">
{
	function Validempid(id){
		regex =  /^[a-zA-Z]{4,10}$/;

		if (!regex.test(id))
		{
          return false;
		}
		else return true;
	}

		function Validpwd(id){
		regex =  /^[a-zA-Z0-9]{6,10}$/;

		if (!regex.test(id))
		{
          return false;
		}
		else return true;

	}
	
	function Validate()
	{
		
		document.getElementById("logincheck").innerHTML = "Please wait...Processing";
		
		if(document.login.username.value=="" || document.login.password.value==""||Validempid(document.login.username.value)||Validpwd(document.login.password.value))
		{

		  return ;
		}
		  
		  document.login.submit();
		
	}

}
</script>
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
	background-image:URL("toplinks.jpg");
	color: white;
    
	font-weight:bold;


}
	.listhead
	{
		
		text-align:center;
		background-image:URL('cathead.jpg');
		font-weight:bold;
		color:white;
	}

		.featured
	{
		text-align:center;
		background-image:URL('featured.jpg');
		font-weight:bold;
		color:white;
	}

	.footer{
		background-image: URL('footerline.jpg');
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
	<TD><img src = "logo.jpg"/></TD>
</TR>
</TABLE>
</div>
<!--Link Land-->

<div  width="960">
<TABLE class="linkTable" border ="0" width = "960" height="25" style="border-color:#90A7BD;">
<TR><TD  >
<a class="toplinks" title="Home" href="http://csci4xx.usc.edu:9007/mtpress/main.jsp"  STYLE = "text-decoration:none;">Home</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
 <a class="toplinks" title="Login" href="http://csci4xx.usc.edu:9007/mtpress/login.jsp" STYLE = "text-decoration:none;">Sign in</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
 <a class="toplinks" title="Create Account" href="http://csci4xx.usc.edu:9007/mtpress/customerRegister.jsp" STYLE = "text-decoration:none;">Register</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
 <a class="toplinks" title="Category" href="http://csci4xx.usc.edu:9007/mtpress/display.jsp" STYLE = "text-decoration:none;">Browse Books</a> &nbsp; &nbsp; &nbsp; 
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
  <form name= "login"  id = "login" action = "validateLogin.jsp"  method = "POST">
	<TABLE cellpadding="10" >
	    
	    <TR>
		<Th align= left style="font-size:20px;padding-top:0.4cm"><b>Sign in</b></Th>
    </TR>
   
	<TR>
		<TD id = "logincheck" colspan = "2" class ="col1"> <Font color = "red" >Invalid login. Please try again...</font> </TD>
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
	</form>

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
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/about.jsp" STYLE = "text-decoration:none;">ABOUT</a>
              </SPAN>&nbsp; | &nbsp;</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/copyright.jsp" STYLE = "text-decoration:none;">COPYRIGHT</a>
              </SPAN>&nbsp; | &nbsp;
	</TD>

	<TD WIDTH = "250">
	</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/termsOfUse.jsp" STYLE = "text-decoration:none;">TERMS OF USE</a>
              </SPAN>&nbsp; | &nbsp;</TD>

	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;">COPY RIGHT @CSCI571 SUMMER-2010 </a>
              </SPAN></TD>

</TR>
</TABLE>

</div>


 
 </BODY>
</HTML>
