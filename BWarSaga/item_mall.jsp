<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>B-War Saga Online</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24;
	color: #FFFFFF;
}


-->
</style>
</head>
<%
	String userNm = (String)session.getAttribute("SUserName");
	String nama = "";
	if(userNm == null || userNm.equals(""))
	{
		response.sendRedirect("index.jsp");
		return;
	}
	else
	{
		nama = userNm;
	}
	
	String path = application.getRealPath("WEB-INF/data-bwar.mdb");
	Data data = new Data(path);
	Item item=new Item();
	User user=new User();
	
	Vector vec=new Vector();
	Vector vUser = new Vector();
	data.setUserData(1,(String)session.getAttribute("SUserID"));
	vUser=data.getUserData();
	user=(User)vUser.get(0);
	
	String searchedBarang=request.getParameter("txtSearch");
	if(searchedBarang==null)searchedBarang="";
	data.setItemData(2,searchedBarang);
	vec=data.getItemData();
	
	int dataPerPage=3;
	int totalPage=(int)Math.ceil((double)vec.size()/dataPerPage);
	int pageNow=1;
	if(request.getParameter("page")!=null)pageNow=Integer.parseInt(request.getParameter("page"));
	
%>
<body>
<div id="headerPan"></div>
<div id="mainBody">
  <div id="leftPan">
    <h2>Welcome</h2>
    <p>&nbsp;</p>
    <div id="box">
      <br />Welcome <%= nama%><br /><br />
      <a href="logout.jsp">Back to Login page (Logout)</a>
      <br />
      <br />
    </div>
    <br />
    <h2>Menu</h2>
    <p>&nbsp;</p>
    <div id="box">
      <br />
      <a href="profile.jsp">Profile</a><br />
      <br />
      <a href="lihat_barang.jsp">Inventory</a>
      <br />
      <br />
    <a href="isi_voucher.jsp">Voucher Refill</a><br /><br /></div>
    <p></p>
  </div>
  <div id="rightPan">
    <h2><a href="buy_vouchers.jsp" class="eve" title="Buy Vouchers"> Buy Vouchers</a> </h2>
    <h2> <a href="item_mall.jsp" class="work" title="Item Mall"> Item Mall</a></h2>
    <h2 class="about">Item Mall</h2>
    <p>&nbsp;</p>
    <p class="style1">&nbsp; </p>
    <p class="style1">Insert the amount of items you want to buy at the text box beside the &quot;Buy&quot; button and press the button to purchase.</p>
    <p class="style1">&nbsp;</p>
    <form id="form2" name="form2" method="post" action="">
	<input type="hidden" value="<%= item.getItemID() %>" name="itemID">
      <table width="550" border="0" cellspacing="5" cellpadding="5">
        <tr class="style1">
          <td width="129">Item Name</td>
          <td width="75">Price</td>
          <td width="38">Stock</td>
          <td width="151">Description</td>
          <td width="75">Buy</td>
        </tr>
		 <%
			for(int i=0;i<dataPerPage&& i+(pageNow-1)*dataPerPage<vec.size();i++)
			{
				item=(Item)vec.get(i+(pageNow-1)*dataPerPage);
		  %>
        <tr>		  
          <td><%=item.getItemName()%></td>
 		  <td><%=item.getItemCoin()%></td>
		  <td><%=item.getItemQty()%></td>
		  <td><%=item.getItemDesc()%></td>		
          <td><label>
		  	<a href=set_item_qty.jsp?itemID=<%=item.getItemID()%>>buy</a>		  	
          </label></td>
        </tr>
		<%
			}
		%>
      </table>
	  <%
		for(int i=1;i<=totalPage;i++)
		{
			out.print("<a href=\"item_mall.jsp?page="+i+"\">"+i+"</a>");
			out.print("&nbsp;&nbsp;&nbsp;");
		}
	%> 
    </form><br />
	
	<form name="form3" method="post" action="item_mall.jsp">
  Search : 
  <label>
  <input name="txtSearch" type="text" id="txtSearch" value="">
  </label>
  <label>
  <input type="submit" name="Submit" value="GO!">
  </label>
</form>
    <p>&nbsp;</p>
    <table width="536" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td width="233" class="style1">Your coin amount</td>
        <td width="266" class="style1"><%=user.getUserCoin()%></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p><a href="lihat_barang.jsp">&gt;&gt; See Inventory</a></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
  <br class="blank" />
</div>
<div id="footerMain">
  <div id="footer">
    <p>&copy; Copyright B-war Saga Online</p>
  </div>
</div>
</body>
</html>
