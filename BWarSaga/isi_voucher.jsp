<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
    <h2 class="about">Voucher Refill</h2>
    <p>&nbsp;</p>
    <p class="style1">Insert the serial number for the voucher that has been given on the form below.</p>
    <p class="style1">If transaction succeded, the coin value will be automatically added to your coin value.</p>
    <p class="style1">If you want to check your coin value, you can go to profile page.</p>
    <p class="style1">&nbsp;</p>
    <p class="style1">&nbsp;</p>
    <p>&nbsp;</p>
    <table width="500" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td width="233" class="style1">Voucher</td>
        <td width="230" class="style1"><form id="form1" name="form1" method="post" action="doUpdateIsiVoucher">
            <label>
            <input name="txtKdVoucher" type="text" id="txtKdVoucher" />
            </label>
            
              <label>
              <input type="submit" name="button" id="button" value="Submit" />
              </label>
            	<input name="userid" type="hidden" id="userid" value="<%=userID%>" />
	  			<input type="hidden" value="<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>" name="path">
        </form>        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <span class="style2">
	<%
	  	String err=request.getParameter("errMsg");
		if(err!=null)out.print(err);
		else
		out.print(" ");
	  %></span>
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
