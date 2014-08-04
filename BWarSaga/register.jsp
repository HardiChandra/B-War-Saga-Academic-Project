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
	color: #FFFFFF;
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
		  <input name="txtPass" type="text" id="txtPass">          
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
    </div>
    <p></p>
  </div>
  <div id="rightPan">
    <p><form id="form2" name="form2" method="post" action="doReg">
    <table width="436" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td colspan="2" class="style1">Register Here</td>
      </tr>
      <tr>
        <td width="158">Username</td>
        <td width="241"><label>
			<input name="txtName" type="text" id="txtName" />
        </label></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><label>
          <input name="txtPass" type="password" id="txtPass" />
        </label></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><label>
          <input name="txtNama" type="text" id="txtNama" />
        </label></td>
      </tr>
      <tr>
        <td>Gender</td>
        <td>
        <input name="radiobutton" type="radio" value="pria" />
      Male 
      <input name="radiobutton" type="radio" value="wanita" />
      Female</td>
      </tr>
      <tr>
        <td>Telephone Number</td>
        <td><label>
          <input name="txtTelp" type="text" id="txtTelp" />
        </label></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><label>
          <input name="txtAddr" type="text" id="txtAddr" />
        </label></td>
      </tr>
      <tr>
        <td>City</td>
        <td><label>
          <input name="txtCity" type="text" id="txtCity" />
        </label></td>
      </tr>
	  <tr>
      <td>&nbsp;</td>
      <td><%
	  String errReg=request.getParameter("errReg");
	  if(errReg!=null)out.print(errReg);
	  %>
	  <input type="hidden" value="<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>" name="path">
	  
	  </td>
    </tr>
      <tr>
        <td>&nbsp;</td>
        <td><label>
           <input type="submit" name="Submit" value="Submit" />
          <input type="reset" name="Submit2" value="Reset" />
        </label></td>
      </tr>
      <tr>
        <td colspan="2"><a href="index.jsp">Back to Index</a></td>
        </tr>
    </table>
    </form></p>
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
