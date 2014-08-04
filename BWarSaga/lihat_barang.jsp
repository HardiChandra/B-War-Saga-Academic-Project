<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, bean.*, java.util.*" errorPage="" %>
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
	String userID = (String)session.getAttribute("SUserID");
	if(userID == null)
		response.sendRedirect("index.jsp");
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
	String path = application.getRealPath("WEB-INF/data-bwar.mdb");
	Data data = new Data(path);
	data.setShoppingData(userID);
	data.setVoucherData(1, userID);
	Vector vItem = data.getItemData();
	Vector vVoucher = data.getVoucherData();
	Vector vShop= data.getShoppingData();
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
    <h2 class="about">User Inventory</h2>
    <p>&nbsp;</p>
    <p class="style1">Voucher List</p>
    <p>&nbsp;</p>
    <table width="500" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td width="233" class="style1">Voucher</td>
        <td width="230" class="style1">Voucher Number</td>
        <td width="230" class="style1">Voucher Status </td>
      </tr>
	   <%
  		for(int i = 0; i < vVoucher.size(); i++)
		{
		  	Voucher voucher = (Voucher)vVoucher.get(i);
	  %>
      <tr>
        <td><%= voucher.getVoucherNumber()%></td>
        <td><%= voucher.getVoucherCoin()%></td>
        <td><%if(voucher.getVoucherStatus()==0)
				out.print("NEW!");
				else
				out.print("Sudah terpakai");
		%></td>
      </tr>
	  <%
		}
	  %>
    </table>
    <p>&nbsp;</p>
    <p>Item List</p>
    <p>&nbsp;</p>
    <table width="500" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td width="296" class="style1">Item Name</td>
        <td width="296" class="style1">Date</td>
        <td width="167" class="style1">Quantity</td>
      </tr>
	  <%
		for(int j = 0; j < vItem.size(); j++)
		{
			Item item = (Item)vItem.get(j);
			Shopping shop=(Shopping)vShop.get(j);
	  %>
      <tr>
        <td><%= item.getItemName()%></td>
        <td><%=shop.getDateID()%></td>
        <td><%= shop.getShoppingQty()%></td>
      </tr>
	  <%
		}
	  %>
    </table>
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
