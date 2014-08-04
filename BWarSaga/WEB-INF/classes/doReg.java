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

public class doReg extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String user=request.getParameter("txtName");
		String pass=request.getParameter("txtPass");
		String nama=request.getParameter("txtNama");
		String telp=request.getParameter("txtTelp");
		String addr=request.getParameter("txtAddr");
		String city=request.getParameter("txtCity");
		String gender=request.getParameter("radiobutton");

        try {
			if(user==null||user.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=User Name harus diisi");
				return;
			}
			else
			if(pass==null||pass.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=Password harus diisi");
				return;
			}
			else
			if(nama==null||nama.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=Nama harus diisi");
				return;
			}
			else
			if(gender==null)
			{
				response.sendRedirect("register.jsp?errReg=Gender harus diisi");
			}
			else
			if(telp==null||telp.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=Telp harus diisi");
				return;
			}
			else
			if(addr==null||addr.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=address harus diisi");
				return;
			}
			else
			if(city==null||city.equals(""))
			{
				response.sendRedirect("register.jsp?errReg=City harus diisi");
				return;
			}
			else
			{
				String path=request.getParameter("path");
				doConnect dc=new doConnect(path);
				Statement stmt=dc.getStmt();
				ResultSet rs=stmt.executeQuery("select * from msuser where username='"+user+"'");
				if(!rs.next())
					stmt.executeUpdate("insert into msuser(username,userpass,role,gender,phone,address,city,usercoin,nama) values('"+user+"','"+pass+"','user','pria','"+telp+"','"+addr+"','"+city+"',0,'"+nama+"')");
				else
					response.sendRedirect("register.jsp?errReg=username telah dipakai");
				dc.getCon().close();

				response.sendRedirect("index.jsp");
			}

		}catch(Exception e){
			out.println(e);
			out.println(user+pass+nama+telp+gender+addr+city);
		}finally {
		out.close();

        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
