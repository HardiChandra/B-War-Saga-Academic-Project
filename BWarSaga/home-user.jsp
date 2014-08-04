<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>B-War Saga Online</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24;
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
	
	Integer total = (Integer)application.getAttribute("totalUser");	
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
	  <br/>
	  Online soldiers:
	  <br/>
	  <%=total%>
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
    <h2 class="about">Welcome to B-War Saga Online</h2>
    <p>&nbsp;</p>
    <p>Features :</p>
    <p>* Play for free</p>
    <p>* Join the fiercest battle on earth, all from your home</p>
    <p>* Make friends, join alliances, conquer the enemy</p>
    <p>* Defend your base camp, build forts and buildings</p>
    <p>* All new weapon as real as the real one</p>
    <p>* Weekly Updated items at the item mall</p>
    <p>&nbsp;</p>
    <p>We want you soldiers!</p>
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
