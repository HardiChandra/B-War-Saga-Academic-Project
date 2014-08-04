<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<body>
<div id="headerPan"></div>
<div id="mainBody">
  <div id="leftPan">
    <h2>Login</h2>
    <p>&nbsp;</p>
    <div id="box">
      <form id="form1" name="form1" method="post" action="doLogin">
        Username<br />
          <label>
		  <input name="txtUser" type="text" id="txtUser">          
          </label>
          Password<br />
          <label>
		  <input name="txtPass" type="password" id="txtPass" value="">          
          </label>
		  <%
		  String err=request.getParameter("err");
		  if(err!=null)out.print(err);
		  %>
		  <input type="hidden" value="<%= application.getRealPath("WEB-INF/data-bwar.mdb")%>" name="path">
          <label>
          <input type="submit" name="button" id="button" value="Submit" />
          </label>
          <a href="register.jsp">Register</a>
      </form>
    </div>
    <p></p>
  </div>
  <div id="rightPan">
    <h2 class="about">WELCOME TO THE WEB</h2>
    <p>Welcome to B-War Saga Online.</p>
    <p>Play with billon people around the world!!</p>
    <p>Please log in to continue</p>
    <p>&nbsp;</p>
    <p>* Free to play</p>
    <p>* Meet new friends and join new advantures</p>
    <p>&nbsp;</p>
    <p><a href="home-guest.jsp">Go to Home -&gt;</a></p>
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
