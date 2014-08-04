package servlet;

import java.io.*;
import java.net.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.*;
import java.util.*;
import java.util.Date;
import java.text.*;

public class doLogin extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

        try {
			String user=request.getParameter("txtUser");
			String pass=request.getParameter("txtPass");

			if(user==null||user.equals(""))
			{
				response.sendRedirect("index.jsp?err=User Name harus diisi");
				return;
			}
			else
			if(pass==null||pass.equals(""))
			{
				response.sendRedirect("index.jsp?err=Password harus diisi");
				return;
			}
			else
			{
				String path=request.getParameter("path");
				doConnect dc=new doConnect(path);
				Statement stmt=dc.getStmt();
				ResultSet rs=stmt.executeQuery("select * from msuser where username='"+user+"' and userpass='"+pass+"'");
				if(rs.next())
				{

					response.sendRedirect("doLogin.jsp?userid="+rs.getInt(1)+" &username="+rs.getString(2)+"&role="+rs.getString(4));
					dc.getCon().close();
				}
				else
				{
					response.sendRedirect("index.jsp?err=User and Pass salah");
					return;
				}
			}

		}catch(Exception e){
					//response.sendRedirect("profile.jsp?errMsg="+e);
		}finally {
		out.close();

        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
