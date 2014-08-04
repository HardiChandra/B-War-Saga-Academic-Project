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

public class doDelete extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

		        response.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        try {
						String path=request.getParameter("path");
						Data data=new Data(path);
						Vector vec=new Vector();
						Voucher voucher=new Voucher();
						User user=new User();
						String userid=request.getParameter("userid");

						data.setUserData(1,userid);
						vec=data.getUserData();

						if(vec!=null)user=(User)vec.get(0);

						doConnect dc=new doConnect(path);
						Statement stmt=dc.getStmt();

						stmt.executeUpdate("delete from msuser where userid="+userid+"");
						stmt.executeUpdate("delete from msshopping where userid="+userid+"");
						stmt.executeUpdate("delete from msvoucher where userid="+userid+"");

						dc.getCon().close();
						response.sendRedirect("manage_user.jsp");


		        }catch(Exception e){out.print("err");} finally {
		            out.close();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
