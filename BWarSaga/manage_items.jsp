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
		response.sendRedirect("index.jsp");return;
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
	String path = application.getRealPath("WEB-INF/data-bwar.mdb");
	Data data = new Data(path);	
	Item item=new Item();
	Vector vec=new Vector();
	
	String searchedBarang=request.getParameter("txtSearch");
	if(searchedBarang==null)searchedBarang="";
	data.setItemData(2,searchedBarang);
	vec=data.getItemData();
	
	int dataPerPage=3;
	int totalPage=(int)Math.ceil((double)vec.size()/dataPerPage);
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
    <h2 class="about">Manage Items</h2>
    <p>&nbsp;</p>
    <p class="style1">Item Managements</p>
    <p class="style1">&nbsp;</p>
    
      <table width="550
      " border="0" cellspacing="5" cellpadding="5">
        <tr class="style1">
          <td width="114">Item Name</td>
          <td width="68">Price</td>
          <td width="40">Stock</td>
          <td width="133">Description</td>
          <td width="113">Option</td>
        </tr>
		<%
  	for(int i=0;i<dataPerPage&& i+(pageNow-1)*dataPerPage<vec.size();i++)
	{
		item=(Item)vec.get(i+(pageNow-1)*dataPerPage);
  %>
  <form id="form2<%=i%>" name="form2<%=i%>" method="get" action="manage_items.jsp">
    <tr>
      <input name="txtID" type="hidden" value="<%=item.getItemID()%>" />
      <td><%=item.getItemName()%>
      </td>
      <td>
	  <%=item.getItemCoin()%>
	  </td>
      <td><%=item.getItemQty()%></td>
      <td><%=item.getItemDesc()%></td>
      <td>
	  <input name="button" type="submit" id="button" value="Update" />
	  <a href="doDeleteItem?itemID=<%=item.getItemID()%>&path=<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>">Delete</a>
	  </td>
    </tr>
	</form>
    <%
	}
%>        
      </table>
	  
	  <%
		for(int i=1;i<=totalPage;i++)
		{
			out.print("<a href=\"manage_items.jsp?page="+i+"\">"+i+"</a>");
			out.print("&nbsp;&nbsp;&nbsp;");
		}
		String err="";
		if(request.getParameter("err")!=null)err=request.getParameter("err");
		out.println("<br>");
		out.print(err);
	%>
      <br />
  <form name="form10" method="post" action="manage_items.jsp">
  	Search : 
  
  	<input name="txtSearch" type="text" id="txtSearch" value="">
   	<input type="submit" name="Submit" value="GO!">
  	
   </form>
	
   
      <br />
    
    <hr />
    <br />
	<%
	String txtid=request.getParameter("txtID");
	String name,desc;
	int qty,coin;
	if (txtid==null)
	{
		name=desc="";
		qty=coin=0;
	}
	else{
	
	
	Data data2 = new Data(path);	
	data2.setItemData(1,txtid);
	
	Vector vec2=new Vector();
	vec2=data2.getItemData();
	
	Item item2=new Item();
	item2=(Item)vec2.get(0);
	name=item2.getItemName();
	coin=item2.getItemCoin();
	qty=item2.getItemQty();
	desc=item2.getItemDesc();
	}
	%>
    <form id="form4" name="form4" method="post" action="doUpdateItem">
    <table width="436" border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td colspan="2" class="style1">Update Item</td>
      </tr>
      <tr>
        <td width="158">Item Name</td>
        <td width="241"><label>
          <input name="txtName" type="text" value="<%=name%>" />
        </label></td>
      </tr>
      <tr>
        <td>Price</td>
        <td><label>
          <input name="txtCoin" type="text" value="<%=coin%>" />
        </label></td>
      </tr>
      <tr>
        <td>Stock</td>
        <td><label>
          <input name="txtQty" type="text" value="<%=qty%>" />
        </label></td>
      </tr>
      <tr>
        <td>Descriptions</td>
        <td><label>
          <textarea name="txtDesc" cols="45" rows="5"><%=desc%></textarea>
        </label></td>
      </tr>
	  <input type="hidden" value="<%=application.getRealPath("WEB-INF/data-bwar.mdb")%>" name="path">
	  <input name="txtID" type="hidden" value="<%=txtid%>" />
      <tr>
        <td>&nbsp;</td>
        <td><label>
          <input type="submit" name="button2" id="button2" value="Submit" />
          <input type="reset" name="button3" id="button3" value="Reset" />
        </label></td>
      </tr>
    </table>
    <br />
    <span class="style2"></span>
    </form><br />
    
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
