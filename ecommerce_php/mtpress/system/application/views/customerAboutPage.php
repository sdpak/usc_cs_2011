
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


	.footer{
		background-image: URL('http://csci4xx.usc.edu:9007/mtpress/footerline.jpg');
	}
	.profilelistholder
	{
		background-color:#F4F3F3;
		padding:1mm 3mm 1mm 3mm;
	}



  </style>
  <script type="text/javascript">
function loadXMLDoc()
{
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("ajaxitem").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","http://csci4xx.usc.edu:9007/mtpress/about.txt",true);
xmlhttp.send();
}
</script>
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

<div>
<TABLE  cellpadding = "40" width = 960>
<TR>
	<TD>
	<p>About THE MT PRESS  </P>
	<ul>
	<li>This Site used for ordering books.
	<li>You can browse through the books available by category.
	<li>You can add a book to your cart
	<li>A book cannot be added twice to the same cart, how ever you can edit the cart for quantity.
	<li>The site does not store the credit card details. you can give the patment details while checkout.
	<li>The Ordered books are reached to the customer by 7 days.
	
	</ul>
	
	<button type="button" onclick="loadXMLDoc()">Change Content</button>Click for more information of the Designer.
	</TD>
</TR>

<TR>
	<TD ></TD>
</TR>
<TR>
	<TD align =center id = "ajaxitem">&nbsp;</TD>
</TR>
</TABLE>
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
</div>




 
 </BODY>
</HTML>

