package servlet;

import java.io.*;
import java.net.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.*;
import java.util.*;


public class doDeleteItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
				String path=request.getParameter("path");

				Data data=new Data(path);
				Vector vec=new Vector();

				Item item=new Item();
				String itemid=request.getParameter("itemID");

				data.setItemData(1,itemid);
				vec=data.getItemData();

				if(vec!=null)item=(Item)vec.get(0);


				doConnect dc=new doConnect(path);
				Statement stmt=dc.getStmt();

				stmt.executeUpdate("delete from msitem where itemid="+itemid+"");

				dc.getCon().close();
				response.sendRedirect("manage_items.jsp");


        }catch(Exception e){out.print(e);} finally {
            out.close();
        }    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
