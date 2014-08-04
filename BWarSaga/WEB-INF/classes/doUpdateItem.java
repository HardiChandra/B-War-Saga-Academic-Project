package servlet;

import java.io.*;
import java.net.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.*;
import java.util.*;


public class doUpdateItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

				//String btn=request.getParameter("button");
				//String itemid=btn.substring(btn.indexOf(":")+1);
				String itemid=request.getParameter("txtID");
				String name=request.getParameter("txtName");
				String coin=request.getParameter("txtCoin");
				String qty=request.getParameter("txtQty");
				String desc=request.getParameter("txtDesc");

				boolean statusQty=false,statusPrice=false;
				try{
					Integer.parseInt(qty);
					statusQty=true;
				}catch(Exception e)
				{
					statusQty=false;
				}
				try{
					Integer.parseInt(coin);
					statusPrice=true;
				}catch(Exception e)
				{
					statusPrice=false;
				}

				if(name==null||name.length()==0)
					response.sendRedirect("manage_items.jsp?err=Nama harus diisi");
				else
				if(coin==null||coin.length()==0)
					response.sendRedirect("manage_items.jsp?err=Price harus diisi");
				else
				if(qty==null||qty.length()==0)
					response.sendRedirect("manage_items.jsp?err=Qty harus diisi");
				else
				if(desc==null||desc.length()==0)
					response.sendRedirect("manage_items.jsp?err=Desc harus diisi");
				else
				if(statusQty==false)
					response.sendRedirect("manage_items.jsp?err=Qty harus diisi dengan angka");
				else
				if(statusPrice==false)
					response.sendRedirect("manage_item.jsp?err=Price harus diisi dengan angka");
				else{
				String path=request.getParameter("path");
				doConnect dc=new doConnect(path);
				Statement stmt=dc.getStmt();

				stmt.executeUpdate("update msitem set itemname='"+name+"', itemqty="+qty+", itemcoin="+coin+", itemdesc='"+desc+"' where itemid="+itemid+"");

				dc.getCon().close();
				response.sendRedirect("manage_items.jsp");
			}

        }catch(Exception e){out.print(e);} finally {
            out.close();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
