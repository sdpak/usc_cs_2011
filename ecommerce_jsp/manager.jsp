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
 <script type="text/javascript">


var userCount = 0;

var clickedIt = false;


var fname = new Array();
var lname = new Array();
var uname = new Array();
var phno = new Array();
var emid = new Array();
var conty = new Array();
var ste = new Array();
var ct = new Array();
var sexx = new Array();
var pw1 = new Array();
var pw2 = new Array();
var eduLevel = new Array();
var timePass = new Array();
var fieldInterest = new Array();
var ageGroup = new Array();



var qu1 = "";
var qu2 = "";
var qu3 = "";
var qu4 = "";
var qu5 = "";
var qu6 = "";
var qu7 = "";
var qu8 = "";
var qu9 = "";
var qu10 = "";
var qu11 = "";
var qu12 = "";
var qu13 = "";
var qu14 = "";
var fedbak = "";
var rightScore = 0;
var score = new Array();

var quizTaken = false;


var c=0;
var t;









////////////////////////////////////////////////////////////////////////////////selectChange1///////////////////////////////////////////////////////////////////////////////



function selectChange1()
{

var cntry = "";
for (var i=0; i < document.locationReport.country.length; i++)
   {
   if (document.locationReport.country[i].selected)
      {
      cntry = cntry + document.locationReport.country[i].value + "\n";
      }
   }


var stt = document.locationReport.state;

stt.options.length = 0;


var cty = document.locationReport.city;

cty.options.length = 0;


 

if (cntry == "CA\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('LA','LA');
stt.options[stt.options.length] = new Option('SB','SB');
stt.options[stt.options.length] = new Option('SF','SF');
stt.options[stt.options.length] = new Option('Others','Others');

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('Others','Others');

}




if (cntry == "FL\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Callaway','Callaway');
stt.options[stt.options.length] = new Option('CooperCity','CooperCity');
stt.options[stt.options.length] = new Option('Miami','Miami');
stt.options[stt.options.length] = new Option('Others','Others');


cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32460','32460');
cty.options[cty.options.length] = new Option('Others','Others');
}



if (cntry == "MA\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Hampden','Hampden');
stt.options[stt.options.length] = new Option('Bristol','Bristol');
stt.options[stt.options.length] = new Option('Essex','Essex');
stt.options[stt.options.length] = new Option('Others','Others');


cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01029','01029');
cty.options[cty.options.length] = new Option('Others','Others');
}



if (cntry == "CH\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Barrington','Barrington');
stt.options[stt.options.length] = new Option('Bolingbrook','Bolingbrook');
stt.options[stt.options.length] = new Option('EastChicago','EastChicago');
stt.options[stt.options.length] = new Option('Others','Others');


cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60038','60038');
cty.options[cty.options.length] = new Option('Others','Others');
}




if (cntry == "Others\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Others','Others');

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('Others','Others');

}




if (cntry == "1\n")
{
stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('LA','LA');
stt.options[stt.options.length] = new Option('SB','SB');
stt.options[stt.options.length] = new Option('SF','SF');
stt.options[stt.options.length] = new Option('Callaway','Callaway');
stt.options[stt.options.length] = new Option('CooperCity','CooperCity');
stt.options[stt.options.length] = new Option('Miami','Miami');
stt.options[stt.options.length] = new Option('Hampden','Hampden');
stt.options[stt.options.length] = new Option('Bristol','Bristol');
stt.options[stt.options.length] = new Option('Essex','Essex');
stt.options[stt.options.length] = new Option('Barrington','Barrington');
stt.options[stt.options.length] = new Option('Bolingbrook','Bolingbrook');
stt.options[stt.options.length] = new Option('EastChicago','EastChicago');
stt.options[stt.options.length] = new Option('Others','Others');



cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('93106','93106');
cty.options[cty.options.length] = new Option('93127','93127');
cty.options[cty.options.length] = new Option('94101','94101');
cty.options[cty.options.length] = new Option('94142','94142');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32605','32605');
cty.options[cty.options.length] = new Option('33024','33024');
cty.options[cty.options.length] = new Option('33077','33077');
cty.options[cty.options.length] = new Option('33101','33101');
cty.options[cty.options.length] = new Option('33164','33164');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01045','01045');
cty.options[cty.options.length] = new Option('02718','02718');
cty.options[cty.options.length] = new Option('02725','02725');
cty.options[cty.options.length] = new Option('01929','01929');
cty.options[cty.options.length] = new Option('01967','01967');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60122','60122');
cty.options[cty.options.length] = new Option('60440','60440');
cty.options[cty.options.length] = new Option('60477','60477');
cty.options[cty.options.length] = new Option('60601','60601');
cty.options[cty.options.length] = new Option('60656','60656');
cty.options[cty.options.length] = new Option('Others','Others');




}


}










////////////////////////////////////////////////////////////////////selectChange2///////////////////////////////////////////////////////////////////////////////////////////

  

function selectChange2()
{

var stat = "";
for (var i=0; i < document.locationReport.state.length; i++)
   {
   if (document.locationReport.state[i].selected)
      {
      stat = stat + document.locationReport.state[i].value + "\n";
      }
   }


var cty = document.locationReport.city;

cty.options.length = 0;

if (stat == "LA\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "SB\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('93106','93106');
cty.options[cty.options.length] = new Option('93127','93127');
cty.options[cty.options.length] = new Option('Others','Others');

}
if (stat == "SF\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('94101','94101');
cty.options[cty.options.length] = new Option('94142','94142');
cty.options[cty.options.length] = new Option('Others','Others');

}

     

if (stat == "Callaway\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32605','32605');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "CooperCity\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('33024','33024');
cty.options[cty.options.length] = new Option('33077','33077');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Miami\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('33101','33101');
cty.options[cty.options.length] = new Option('33164','33164');
cty.options[cty.options.length] = new Option('Others','Others');

}

    

if (stat == "Hampden\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01045','01045');
cty.options[cty.options.length] = new Option('Others','Others');

}


if (stat == "Bristol\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('02718','02718');
cty.options[cty.options.length] = new Option('02725','02725');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Essex\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01929','01929');
cty.options[cty.options.length] = new Option('01967','01967');
cty.options[cty.options.length] = new Option('Others','Others');

}



    


if (stat == "Barrington\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60122','60122');
cty.options[cty.options.length] = new Option('Others','Others');

}


if (stat == "Bolingbrook\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60440','60440');
cty.options[cty.options.length] = new Option('60477','60477');
cty.options[cty.options.length] = new Option('Others','Others');

}


if (stat == "EastChicago\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60601','60601');
cty.options[cty.options.length] = new Option('60656','60656');
cty.options[cty.options.length] = new Option('Others','Others');

}



if (stat == "Others\n")
{
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('Others','Others');
}


if (stat == "1\n")
{
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('93106','93106');
cty.options[cty.options.length] = new Option('93127','93127');
cty.options[cty.options.length] = new Option('94101','94101');
cty.options[cty.options.length] = new Option('94142','94142');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32605','32605');
cty.options[cty.options.length] = new Option('33024','33024');
cty.options[cty.options.length] = new Option('33077','33077');
cty.options[cty.options.length] = new Option('33101','33101');
cty.options[cty.options.length] = new Option('33164','33164');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01045','01045');
cty.options[cty.options.length] = new Option('02718','02718');
cty.options[cty.options.length] = new Option('02725','02725');
cty.options[cty.options.length] = new Option('01929','01929');
cty.options[cty.options.length] = new Option('01967','01967');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60122','60122');
cty.options[cty.options.length] = new Option('60440','60440');
cty.options[cty.options.length] = new Option('60477','60477');
cty.options[cty.options.length] = new Option('60601','60601');
cty.options[cty.options.length] = new Option('60656','60656');
cty.options[cty.options.length] = new Option('Others','Others');
}




}


function dateValid()
{

var startDate = document.dateReport.stdate.value;


if (startDate == "")
{
	document.getElementById("msg").innerHTML = "Please fill the the Start date";
	document.getElementById("msg").style.colour="red";
	return;
}


var date = /^\d{4}\/\d{2}\/\d{2}$/;
if(date.test(startDate) == false)
{

	document.getElementById("msg").innerHTML = "Date should be in yyyy/mm/dd";
	document.getElementById("msg").style.colour="red";
return;

}
var dateArray = new Array()

	dateArray = startDate.split("/");
		
		for(h=0; h<dateArray.length ;h++)
	{
			dateArray[h] = dateArray[h] *1;
	}

	if ((dateArray[0] < 1995)||(dateArray[0] > 2010))
	{
		document.getElementById("msg").innerHTML = "Can only view reports between 1995-2010";
		document.getElementById("msg").style.colour="red";
		return;
	}

	if ((dateArray[1] >12)||(dateArray[1] == 0))
	{
		document.getElementById("msg").innerHTML = "Start Date not valid";
		document.getElementById("msg").style.colour="red";
		return;
	}

	if ((dateArray[2] >31)||(dateArray[2] == 0))
	{
		document.getElementById("msg").innerHTML = " Start Date not valid";
		document.getElementById("msg").style.colour="red";
		return;
	}













var endDate = document.dateReport.endate.value;


if (endDate == "")
{
	document.getElementById("msg").innerHTML = "Please fill the the End date";
	document.getElementById("msg").style.colour="red";
	return;
}


var date = /^\d{4}\/\d{2}\/\d{2}$/;
if(date.test(endDate) == false)
{

	document.getElementById("msg").innerHTML = "Date should be in yyyy/mm/dd";
	document.getElementById("msg").style.colour="red";
return;

}
var dateArray2 = new Array()

	dateArray2 = endDate.split("/");
		
		for(h=0; h<dateArray2.length ;h++)
	{
			dateArray2[h] = dateArray2[h] *1;
	}

	
		if ((dateArray2[0] < 1995)||(dateArray2[0] > 2010))
	{
		document.getElementById("msg").innerHTML = "Can only view reports between 1995-2010";
		document.getElementById("msg").style.colour="red";
		return;
	}

	if ((dateArray2[1] >12)||(dateArray2[1] == 0))
	{
		document.getElementById("msg").innerHTML = "End Date not valid";
		document.getElementById("msg").style.colour="red";
		return;
	}

	if ((dateArray2[2] >31)||(dateArray2[2] == 0))
	{
		document.getElementById("msg").innerHTML = "End Date not valid";
		document.getElementById("msg").style.colour="red";
		return;
	}



if (dateArray2[0]<dateArray[0])
{
		document.getElementById("msg").innerHTML = "End Date Should Be Greater Than Start Date";
		document.getElementById("msg").style.colour="red";
		return;
}

if (dateArray2[0] == dateArray[0])
{
		if (dateArray2[1]<dateArray[1])
		{
			document.getElementById("msg").innerHTML = "End Date Should Be Greater Than Start Date";
			document.getElementById("msg").style.colour="red";
			return;
		}
}



if (dateArray2[0] == dateArray[0])
{
		if (dateArray2[1] == dateArray[1])
		{
			if (dateArray2[2]<dateArray[2])
			{
				document.getElementById("msg").innerHTML = "End Date Should Be Greater Than Start Date";
				document.getElementById("msg").style.colour="red";
				return;
			}
		}
}



document.dateReport.submit();


}


function prodValid()
{
document.productReport.submit();
}



function regValid()
{
var conty = new Array();
var ste = new Array();
var ct = new Array();

	var city = "";
	var state = "";
	var country = "";
	var zip = "";



var contyt = "";
for (var i=0; i < document.locationReport.country.length; i++)
   {
   if (document.locationReport.country[i].selected)
      {
      contyt = contyt + document.locationReport.country[i].value;
      }
   }

conty[userCount] = contyt;


var stet = "";

for (var i=0; i < document.locationReport.state.length; i++)
   {
   if (document.locationReport.state[i].selected)
      {
      stet = stet + document.locationReport.state[i].value;
      }
   }
ste[userCount] = stet;




var ctt = "";

for (var i=0; i < document.locationReport.city.length; i++)
   {
   if (document.locationReport.city[i].selected)
      {
      ctt = ctt + document.locationReport.city[i].value + "\n";
      }
   }

ct[userCount] = ctt;


if ((conty[userCount] == 1)&&(ste[userCount] == 1)&&(ct[userCount] == 1))
{

document.getElementById("msg").innerHTML = "Please fill Location";
	document.getElementById("msg").style.colour="red";

return;
}






document.locationReport.submit();





}



</script>
  <TITLE>Welcome Manager - The MT Press</TITLE>
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
	color:#F7F5DE;
    font-size: 25;
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
<TR><TD>

View Sales Report


  
 </TD></TR>
</TABLE>

</div>

<div>

<table   width = "960" >
<TR>
	<TD > &nbsp;</TD>
</TR>
<TR>
	<TD align = center style="color:#9D310A;" id ="msg"> &nbsp;</TD>
</TR>
</TABLE>
<table border="1" style="border-width: 1px; border-color:#000000;
	border-style: solid;" width = "960" class = "shoptable">

		<tr class = "shophead">
			<th>View According To Date:</th>
			<th>View According Category</th>
			<th>View According Region</th>
		</tr>
			
		<tr>
		<td align = "center">
		<form name ="dateReport" id = "dateReport" action="dateReport.jsp" method="post">
		<table border = "0" >

		<tr>
			<td><b>Start Date</b></td>
			<td><input type = "text" name = "stdate"><code>yyyy/mm/dd</code></td>
		</tr>

		<tr>
			<td><b>End Date</b></td>
			<td><input type = "text" name = "endate"><code>yyyy/mm/dd</code>				
			</td>
		</tr>
		</table>
		<br/><br/>
		<table align= "center">
		<tr>
		<td>
		<input type = "button" value = "View Report" onclick = "dateValid()"> 
		</td>
		</tr>
		</table>
		</td>

		</form>


		<td>
		<table  align = "center">
			<form name ="productReport" id = "productReport" action="productReport.jsp" method="post">



			<tr align = "center">
			    <td align = "center"><select "name="report" id = "user">

		                   <%
		                    int j;
		                     for (j=0; j<i; j++)
		                    {
		                                    %>
                              <option "value="<%=Category[j]%>"><%out.println(CategoryUpper[j]);%></option>


                       <% } %>
                       
					   </select></td>
			</tr>

			<tr align = "left">
			    <td align = "left">&nbsp;</td>
			</tr>

			<tr align = "left">
			    <td align = "left">&nbsp;</td>
			</tr>

			<tr align = "left">
				<td align = "center" colspan = "2"><input type = "button" value = "View Report" onclick = "prodValid()"> </td>
			</tr>
						</form>
		</table>
		</td>




		<td>
		<table  align = "center">
			<form name ="locationReport" id = "locationReport" action="locationReport.jsp" method="post">

		  <tr  class = "odd">  
			 <td align = "center"><b>Location</b>
				<select name="country" id = "country" onchange = "selectChange1()">
					<option value="1" selected="selected" >Select State</option>
					<option value="CA">CA</option>
					<option value="FL">FL</option>
					<option value="MA">MA</option>
					<option value="CH">CH</option>
					<option value="Others">Others</option>
				</select>
				
				<select name="state" id = "state" onchange = "selectChange2()">
					<option value="1" selected="selected" >Select City</option>
					<option value="LA">LA</option>
					<option value="SB">SB</option>
					<option value="SF">SF</option>
					<option value="Callaway">Callaway</option>
					<option value="CooperCity">CooperCity</option>
					<option value="Miami">Miami</option>
					<option value="Hampden">Hampden</option>
					<option value="Bristol">Bristol</option>
					<option value="Essex">Essex</option>
					<option value="Barrington">Barrington</option>
					<option value="Bolingbrook">Bolingbrook</option>
					<option value="EastChicago">EastChicago</option>
					<option value="Others">Others</option>

				</select>
				
				<select name="city" id = "city">
					<option value="1" selected="selected" >Select Zip</option>
					<option value="90007">90007</option>
					<option value="90028">90028</option>
					<option value="93106">93106</option>
					<option value="93127">93127</option>
					<option value="94101">94101</option>
					<option value="94142">94142</option>
					<option value="32404">32404</option>
					<option value="32605">32605</option>
					<option value="33024">33024</option>
					<option value="33077">33077</option>
					<option value="33101">33101</option>
					<option value="33164">33164</option>
					<option value="01003">01003</option>
					<option value="01045">01045</option>
					<option value="02718">02718</option>
					<option value="02725">02725</option>
					<option value="01929">01929</option>
					<option value="01967">01967</option>
					<option value="60010">60010</option>
					<option value="60122">60122</option>
					<option value="60440">60440</option>
					<option value="60477">60477</option>
					<option value="60601">60601</option>
					<option value="60656">60656</option>
					<option value="Others">Others</option>

				</select>   

				<br/><br/><br/><br/>
			<input type = "button" value = "View Report" onclick = "regValid()">
			</td>
			</tr>
			</form>

		</table>
		</td>
		</tr>
		</br>
	</table>
</br></br>
	<form name ="home" id = "home" action="customerSignout.jsp" method="post">

	<input type = "submit" value = "Sign Out">

	</form>
	

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




