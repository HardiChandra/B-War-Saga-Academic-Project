package servlet;

import java.io.*;
import java.net.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.*;
import java.util.*;

public class doUpdateProfile extends HttpServlet
{
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

				String path=request.getParameter("path");
				Data data = new Data(path);
				Vector vUser = new Vector();
				doConnect dc=new doConnect(path);

				//ambil parameter
				String userID = request.getParameter("txtUserID");
				String userPass = request.getParameter("txtUserPass");

				//cek password kosong ga, pass ga boleh kosong
				if(userPass == null || userPass.equals(""))
				{
					response.sendRedirect("profile.jsp?errMsg=Pass tidak boleh kosong");
				}
				String phone = request.getParameter("txtPhone");
				String addr = request.getParameter("txtAddress");
				String city = request.getParameter("txtCity");
				String nama = request.getParameter("txtNama");

				//update profile yang baru
				try{
					Statement stmt = dc.getStmt();
					stmt.executeUpdate("update msuser set userpass='"+userPass+"', phone='"+phone+"', address='"+addr+"', city='"+city+"', nama='"+nama+"' where userid="+userID);
					dc.getCon().close();
					response.sendRedirect("profile.jsp");
				}
				catch(Exception e)
				{
					response.sendRedirect("profile.jsp?errMsg="+e);
				}


        }catch(Exception e){
			response.sendRedirect("profile.jsp?errMsg="+e);
		} finally {
			out.close();

        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}