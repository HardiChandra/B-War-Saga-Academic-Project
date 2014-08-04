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


public class doUpdateIsiVoucher extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String path=request.getParameter("path");
        try {

				Data data=new Data(path);
				Vector vec=new Vector();
				Voucher voucher=new Voucher();
				User user=new User();

				String kodeVoucher=request.getParameter("txtKdVoucher");
				String userid=request.getParameter("userid");

				boolean status=false;

				try{
					data.setVoucherData(1,userid);
					vec=data.getVoucherData();
					for(int i=0;i<vec.size();i++)
					{
						voucher=(Voucher)vec.get(i);
						if(voucher.getVoucherNumber().equals(kodeVoucher))
							if(voucher.getVoucherStatus()==0)
							{
								status=true;
								break;
							}
					}

				}catch(Exception e)
				{
					status=false;
				}

				data.setUserData(1,userid);
				vec=data.getUserData();

				if(vec!=null)user=(User)vec.get(0);

				if(kodeVoucher==null||kodeVoucher.length()==0)
					response.sendRedirect("isi_voucher.jsp?errMsg=ga boleh kosong");
				else
				if(status)
				{
					int jumlahCoin=voucher.getVoucherCoin()+user.getUserCoin();
					doConnect dc=new doConnect(path);
					Statement stmt=dc.getStmt();
					stmt.executeUpdate("update msvoucher set voucherstatus=1 where userid="+userid+" and voucherid="+voucher.getVoucherID()+"");
					stmt.executeUpdate("update msuser set usercoin="+jumlahCoin+" where userid="+userid+"");
					dc.getCon().close();
					response.sendRedirect("profile.jsp");
				}
				else
				if(!status)
				{
					response.sendRedirect("isi_voucher.jsp?errMsg=salah kode");
			}

        }catch(Exception e){out.print("err");} finally {
            out.close();
        }    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
