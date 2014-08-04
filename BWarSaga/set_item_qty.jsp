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
		response.sendRedirect("index.jsp");return;
	}
	else
	{
		nama = userNm;
	}
	String userID=(String)session.getAttribute("SUserID");
	String itemID=request.getParameter("itemID");

	String path = application.getRealPath("WEB-INF/data-bwar.mdb");
	Data data = new Data(path);	
	Item item=new Item();
	Vector vec=new Vector();
			
	data.setItemData(1,itemID);
	vec=data.getItemData();	
	item=(Item)vec.get(0);
%>
<body>
<div id="headerPan"></div>
<div id="mainBody">
  <div id="leftPan">
    <h2>Welcome</h2>
    <p>&nbsp;</p>
    <div id="box">
      <br />Welcome <%= nama%> <br /><br />
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
    <form name="form1" method="post" action="doBeliItem">
  <table width="80%" border="0">
    <tr>      
      <td class="style1">Name</td>
      <td class="style1">Coin</td>
      <td class="style1">Qty</td>
      <td class="style1">Desc</td>
    </tr>
    <tr>
      <td><%=item.getItemName()%></td>
      <td><%=item.getItemCoin()%></td>
      <td><%=item.getItemQty()%></td>
      <td><%=item.getItemDesc()%></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>set Qty : 
    <label>
      <input name="txtQty" type="text" id="txtQty">
      </label>
    <label>
      <input type="submit" name="Submit" value="Submit">
      </label>
    <input name="txtID" type="hidden" id="txtID" value="<%=item.getItemID()%>">
    <input name="userID" type="hidden" id="txtID" value="<%=userID%>">
    <input type="hidden" value="<%=path%>" name="path">
  </p>
    </form>
<br />
    <span class="style2">
	<%
		String err=request.getParameter("err");
		if(err!=null)out.print(err);	
	%>
	</span>
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

