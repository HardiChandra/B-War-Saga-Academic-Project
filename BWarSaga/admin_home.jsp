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
	Integer total = (Integer)application.getAttribute("totalUser");	
%>
<body>
<div id="headerPan"></div>
<div id="mainBody">
  <div id="leftPan">
    <h2>Welcome</h2>
    <p>&nbsp;</p>
    <div id="box">
      <br />Welcome <%=nama%><br /><br />
      <a href="logout.jsp">Back to Login page (Logout)</a>
      <br />
      <br />
	  <br/>
	  Online soldiers:
	  <br/>
	  <%=total%>
    </div>
    <br />
    <h2>Admin</h2>
    <p>&nbsp;</p>
    <div id="box">
    <br />
      <a href="admin_home.jsp">Home</a><br />
      <br />
      <a href="manage_user.jsp">Manage Users</a><br />
      <br />
      <a href="manage_items.jsp">Manage Items </a><br />
    <br /></div>
    <p></p>
  </div>
  <div id="rightPan">
    <h2 class="about">Welcome to B-War Saga Online Admin panel</h2>
    <p>&nbsp;</p>
    <p>As admin you can manage the users and items here</p>
    <p>Some rules to obey : </p>
    <p>* You can't delete your fellow admins</p>
    <p>* Please make notes if you delete some users</p>
    <p>* If you want to buy some items for yourself please use your user ID</p>
    <p>* Don't forget to answers to users complains if needed</p>
    <p>* Rules are made to be obeyed not to be broken</p>
    <p>&nbsp;</p>
    <p>Remember that we keep your track record so don't ever think to do some reckless things.</p>
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
