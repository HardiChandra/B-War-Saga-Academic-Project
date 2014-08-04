<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
	session.invalidate();	
	Integer total = (Integer)application.getAttribute("totalUser");
	if(total > 0)
	{
		total--;
	}
	application.setAttribute("totalUser", total);
	response.sendRedirect("index.jsp");
%>