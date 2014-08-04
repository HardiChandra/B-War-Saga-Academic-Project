<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, bean.*, java.util.*, servlet.*" errorPage="" %>
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
	data.setUserData(1, userID);
	Vector vUser = new Vector();
	vUser = data.getUserData();			
		
	User user = new User();
	user = (User)vUser.get(0);		
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
    <h2 class="about">User Profile</h2>	
    <p>&nbsp;</p>
	<%
		String userName = user.getUserName();
		String userPass = user.getUserPass();
		String Name = user.getNama();
		String Gender = user.getGender();
		String Telephone = user.getPhone();
		String Address = user.getAddress();
		String City = user.getCity();
		int Coin = user.getUserCoin();
	%>
    <p>Username : <%= userName%></p>
    <p>Password : <%= userPass%></p>
    <p>Name : <%= Name%></p>
    <p>Gender : <%= Gender%></p>
    <p>Telephone Number : <%= Telephone%></p>
    <p>Address : <%= Address%></p>
    <p>City : <%= City%></p>
    <p></p>
    <p>Coin Amount : <%= Coin%></p>
    <p>&nbsp;</p>
    <p><a href="lihat_barang.jsp">&gt;&gt; See Inventory</a></p>
    <hr />
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <form id="form2" name="form2" method="post" action="doUpdateProfile">	
	<input type="hidden" name="txtUserID" value="<%= user.getUserID()%>">
    <table width="436" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td colspan="2" class="style1">Change Profile</td>
      </tr>
      <tr>
        <td width="158">Username</td>
        <td width="241"><%=userName%></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><label>
          <input type="password" name="txtUserPass" value="<%= userPass%>">
        </label></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><label>
          <input type="text" name="txtNama" value="<%= Name%>">
        </label></td>
      </tr>
      <tr>
        <td>Gender</td>
        <td>
		<label>
          <input type="text" readonly="true" name="txtGender" value="<%= Gender%>">
        </label></td>
      </tr>
      <tr>
        <td>Telephone Number</td>
        <td><label>
          <input type="text" name="txtPhone" value="<%= Telephone%>">
        </label></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><label>
          <input type="text" name="txtAddress" value="<%= Address%>">
        </label></td>
      </tr>
      <tr>
        <td>City</td>
        <td><label>
          <input type="text" name="txtCity" value="<%= City%>">
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><label>
          <input type="submit" name="button2" id="button2" value="Submit" />
          <input type="reset" name="button3" id="button3" value="Reset" />
        </label></td>
      </tr>
	  <input type="hidden" value="<%= path%>" name="path">
    </table>
    </form>
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
