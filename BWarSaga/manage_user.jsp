<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bean.*,java.util.*" errorPage="" %>
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

	String role=(String)session.getAttribute("SUserRole");
	if(!role.equals("admin"))
	{
		response.sendRedirect("logout.jsp");
		return;
	}

	String userID = (String)session.getAttribute("SUserID");
	if(userID == null)
		response.sendRedirect("index.jsp");
	String path = application.getRealPath("WEB-INF/data-bwar.mdb");
	Data data = new Data(path);
	Vector vUser = new Vector();
	
	String userName=request.getParameter("txtName");
	if(userName==null||userName.length()==0)userName="";
	data.setUserData(3, userName);
	vUser=data.getUserData();
			
	int dataPerPage=3;
	if(request.getParameter("txtPage")!=null)dataPerPage=Integer.parseInt(request.getParameter("txtPage"));
	
	int totalPage=(int)Math.ceil((double)vUser.size()/dataPerPage);
	int pageNow=1;
	if(request.getParameter("page")!=null)pageNow=Integer.parseInt(request.getParameter("page"));
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
    <h2 class="about">Manage User</h2>
    <p>&nbsp;</p>
    <p class="style1">You cannot delete your fellow admins and make sure that you only delete users that are inactive or users that violated the rules.</p>
    <p class="style1">&nbsp;</p>    	
      <table width="550" border="0" cellspacing="5" cellpadding="5">
	  <tr class="style1">
          <td width="179">User Name</td>
          <td width="184">Password</td>
          <td width="184">Status</td>
          <td width="135">Delete</td>
        </tr>
	  	<%
		  for(int i=0;i<dataPerPage && ((pageNow-1)*dataPerPage+i<vUser.size());i++)
		  {
			User user=(User)vUser.get((pageNow-1)*dataPerPage+i);
		  %>
		  <tr>			
			<td><%=user.getUserName()%></td>
			<td><%=user.getUserPass()%></td>
			<td><%=user.getRole()%></td>
			<td><%if(user.getRole().equals("user")){%>
				<a href="doDelete?userid=<%=user.getUserID()%>&path=<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>">delete</a>
				<%}%>
			</td>
		  </tr>
		  <%
		  }
		  %>                
      </table>
      <br />     
	  <%
	
		for(int i=1;i<=totalPage;i++)
		{
			out.print("<a href=\"manage_user.jsp?page="+i+"&txtPage="+dataPerPage+"\">"+i+"</a>");
			out.print("&nbsp;&nbsp;&nbsp;");
		}
	%>
 
	  <form name="form1" method="post" action="manage_user.jsp">
		  Search by user name 
		  <label>
		  <input name="txtName" type="text" id="txtName">
		  </label>
		  <label>
		  <input type="submit" name="Submit" value="Submit">
		  </label>
	</form>        
	  <br />
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
