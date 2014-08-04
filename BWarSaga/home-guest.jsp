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
<%
	Integer total = (Integer)application.getAttribute("totalUser");
	if(total==null)total=0;
	application.setAttribute("totalUser", total);
%>
</head>
<body>
<div id="headerPan"></div>
<div id="mainBody">
  <div id="leftPan">
  <h2>Welcome</h2>
    <p>&nbsp;</p>
    <div id="box">
      <br />
      Welcome guest<br />
      <br />
      Please login or register ^_^<br />
      <br />
	  
      <br/>
	  Online soldiers:
	  <br/>
	  <%=total%>
	</div>
    
    <br />
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
		  <input name="txtPass" type="password" id="txtPass">          
          </label>
		  <%
		  String err=request.getParameter("err");
		  if(err!=null)out.print(err);
		  %>
		  <input type="hidden" value="<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>" name="path">
          <label>
          <input type="submit" name="button" id="button" value="Submit" />
          </label>
          <a href="register.jsp">Register</a>
      </form>
      <p></p>
    </div>
    <br />
  </div>
  <div id="rightPan">
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
