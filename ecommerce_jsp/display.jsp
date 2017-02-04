
<%@ page import="java.sql.*" %>
<%
try {
			
             
				String FirstName = new String();
				String LastName = new String();
        

		String Category [];
		Category = new String[100];	
				String CategoryUpper [];
		CategoryUpper = new String[100];	
        String ProductId [];
		ProductId = new String[100];
		        String ProductName [];
		ProductName = new String[100];
		        String ProductDescription [];
		ProductDescription = new String[100];
		        String ProductPrice [];
		ProductPrice = new String[100];
		       String ProductAvailability [];
		ProductAvailability = new String[100];
		String CartItemCount = new String();
        
		 String fetchCategory = new String();

		fetchCategory = request.getParameter("categoryfetch");
		 
	 
		int i =0;
		int x =0;
				

	try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

	try {
		
	Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
			Statement s=C.createStatement();
			Statement s1=C.createStatement();
			Statement s2=C.createStatement();
			Statement s3=C.createStatement();

          //  String sql="select FName, LName  from customer where username = '"+user+"'";
			String sql2 = "Select distinct productCategory from product order by productCategory";
			String sql3 = "Select * from product where productCategory ='"+fetchCategory+"' order by productName";
			//s.execute(sql);
			s1.execute(sql2);
			s2.execute(sql3);
		//	s3.execute(sql4);

			//ResultSet rs=s.getResultSet();
			ResultSet rs2=s1.getResultSet();
			ResultSet rs3=s2.getResultSet();
			//ResultSet rs4=s3.getResultSet();
 

     // ------------- Get  Results ------------------------------------->
  
	
	     while(rs2.next()) {
			Category[i] = rs2.getString("productCategory");
             CategoryUpper[i] = Category[i].toUpperCase();
			i++;
    }   
	
	

	 while(rs3.next()) {
		
		    ProductId[x] = rs3.getString("productId");
			ProductName[x] = rs3.getString("productName");
			ProductDescription[x] = rs3.getString("productDescription");
			ProductPrice[x] = rs3.getString("actualPrice");
			ProductAvailability[x] = rs3.getString("currentAvilability");
			
            x++;
    }   



	    //rs.close();
		rs2.close();
			rs3.close();
		//	rs4.close();
			C.close();

			} catch (SQLException E) {
            out.println("SQLException: " + E.getMessage());
            out.println("SQLState:     " + E.getSQLState());
            out.println("VendorError:  " + E.getErrorCode());
        }


%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Welcome To MT Press!</TITLE>
<script type="text/javascript">
function ValidateCheck()
{
document.addtocart.submit();
}

/*//}
var hasChecked = false;



for (var i = 0; i < document.display.selectedBook.length; i++)
{
if (document.display.selectedBook[i].checked== true)
{
hasChecked = true;
break;
}
}


if (hasChecked == false)
{
document.getElementById("checkfield")= "Please select at least one item to Add to Cart";
var f = document.getElementById("checkfield");
f.style.color = "red";
return false;
}
document.addtocart.submit();
} */



</script>
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
	background-image:URL("toplinks.jpg");
	color: white;
    
	font-weight:bold;


}


	.footer{
		background-image: URL("footerline.jpg");
	}
	.profilelistholder
	{
		background-color:#F4F3F3;
		
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
 <a class="toplinks" title="Category" href="http://csci4xx.usc.edu:9007/mtpress/display.jsp" STYLE = "text-decoration:none;">Browse Books</a> &nbsp; &nbsp; &nbsp; |&nbsp;&nbsp; &nbsp;
  
 </TD></TR>
</TABLE>

</div>

<div>

<table width= "960" >
<TR>

<!-- Category List -->
	<TD width="192">
		
	<div style="position:absolute;top:1.5in;">

	<TABLE align = center width = "182"   >
    <TR>
		<TD STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:center;background-color:D9F5C7;padding:1mm 2mm 1mm 2mm" height= "20">SELECT CATEGORY</TD>
    </TR>
    
	                      <form name= "categoryform" action = "http://csci4xx.usc.edu:9007/mtpress/display.jsp" Method =POST>
						    <!--<TR>
						  
						  <TD CLASS = "profilelistholder">
					
						
						<input  class="button" type="submit" value="ALL" style ="width:182;background-color:transparent;text-align:left;font-size: 14px;FONT-WEIGHT:BOLD;color:3570F4;padding:.5mm 2mm .5mm 2mm;border:0px">
                        </SPAN>
						</TD>
						</TR> -->
						<TR>
						<TD style="padding:4mm 0 5mm 0;" >
						 <select style= "width:182;padding:5mm;background-color:F3F3F3;font-size:14px;color:3570F4;Font-weight:bold;"name="categoryfetch" id = "user">

		                   <%
		                    int j;
		                     for (j=0; j<i; j++)
		                    {
		                                    %>
                              <option "value="<%=Category[j]%>"><%out.println(CategoryUpper[j]);%></option>


                       <% } %>
                       
					   </select>
					   		</TD>
						</TR>
                    <TR>
					<TD style="padding:2mm 0 5mm 0;" >
						

					<input  align = left class="button" type="submit" value="View Books >" 
						style ="width:180;text-align:center;font-size: 14px;FONT-WEIGHT:BOLD;color:051C51;padding:.5mm 2mm .5mm 2mm;" >
                        
						 											

						</TD>
						</TR>
						
                        

                        
</form>
</TR>

    </TABLE>

	</div>

	</TD>
	

	<!-- Content-->
	
	
	<TD style = "padding: 4.2mm 2mm " width = "60%">
	
	<div >
	
	<TABLE  align = center  width = "550"  >
    <TR>
		<TD STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#D0D0D0;padding:1mm 2mm 1mm 2mm" height= "20" >BOOK CATEGORY: Category Not Yet Selected</TD>
    </TR>
	
	 </TR>
	 <form name = "displaybook" action = "customerAddToCart.jsp" method = POST>
	 <input type="hidden" name = "bookid" value  = "" />
	 <input type="hidden" name = "bookname" value  = "" />
	 <input type="hidden" name = "bookprice" value  = "" />
	 <input type="hidden" name = "availability" value  = "" />
	 
	      

							 
							 <TR>
									<TD style = "text-align:center;font-weight:bold;font-size:16px;color:B05235;">
									<br/><br/>
									 TO PURCHASE BOOKS YOU NEED TO SIGN IN
									 <br/><br/></TD>
	                         </TR>
	                                


<!-- Display area -->
<% 
						int y =0;
						for(y =0; y<x; y++)	{  %>
                         <TR>
						<TD >
						<Table width = "550" >
						<TR>
							<TD width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Book ID:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(ProductId[y]);%> </SPAN>
                       </TD>
							<TD>&nbsp;</TD>
						</TR>
						<TR>
							<TD  width = "70%"  style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Name:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(ProductName[y]);%> </SPAN>
							</TD>
							<TD>&nbsp;</TD>
						</TR>
						<TR>
							<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Description:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(ProductDescription[y]);%> </SPAN>
							</TD>
							<TD>&nbsp;</TD>
						</TR>
						<TR>
							<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Price:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:4DAA27;"> $<%out.println(ProductPrice[y]);%> </SPAN>
							</TD>
							<TD>&nbsp;</TD>
						</TR>
							<TR>
							<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Availability:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:735767;"> <%out.println(ProductAvailability[y]);%> </SPAN>
							</TD>
							<TD>&nbsp;</TD>
						</TR>


						</Table>
						<HR/>
                        
                         <%
						}						
						%>

						</form>

						<!--Add to CArt Button -->

						<!--<TR>
						<TD  align = center style="padding:2mm 0 5mm 0;" ><br/>
						<form name="addtocart" action = "customerAddToCart.jsp" Method = "POST" >
					    <input   class="button" type="submit" value="Add to Cart >" onclick = "ValidateCheck()"
						style ="width:150;text-align:center;font-size: 14px;FONT-WEIGHT:BOLD;color:051C51;padding:.5mm 2mm .5mm 2mm;" >
					   </form>

						</TD>
						</TR> -->

    </TABLE>

	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

	
	</TD>


	
	<!-- Cart and User info-->
	
	<TD  width = "192">
	&nbsp;
	</TD>

</TR>

</table>
</div>


	





<!-- Footer-->

<div >
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
</div>




 
 </BODY>
</HTML>

<%

	} catch (Exception E) {

String fail ="http://cs-server.usc.edu:9007/mtpress/sessionLogin.jsp";
response.sendRedirect(fail);

}


%>

