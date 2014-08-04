<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>
<%
	String userid,username,userrole;
	
	userid=request.getParameter("userid");
	username=request.getParameter("username");
	userrole=request.getParameter("role");
	
	session.setAttribute("SUserID", userid);
	session.setAttribute("SUserName", username);
	session.setAttribute("SUserRole",userrole);
	//jumlah user yang online
	Integer total = (Integer)application.getAttribute("totalUser");
	if(total == null || total < 0)
	{		
		total = 0;
	}	
	else total++;
	application.setAttribute("totalUser", total);
	
	
	if(userrole.equals("admin"))
		response.sendRedirect("admin_home.jsp");
	else if(userrole.equals("user"))
		response.sendRedirect("home-user.jsp");

%>
<body>
</body>
</html>
