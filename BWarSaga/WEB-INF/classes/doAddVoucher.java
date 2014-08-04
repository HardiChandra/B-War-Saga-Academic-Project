package servlet;

import java.io.*;
import java.net.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

import java.lang.Math.*;

import bean.*;

public class doAddVoucher extends HttpServlet
{
	private String noVoucher;

	public String generateVoucher()
	{
		String kdTemp = "";
		Random rand = new Random();
		for(int i = 0; i < 6; i ++)
		{
			int temp = rand.nextInt(10);
			kdTemp = kdTemp + temp;
		}
		return kdTemp;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				try{
					String id = request.getParameter("userID");
					int coin;
					String tipe = "";

					String path=request.getParameter("path");

					//cek tipe voucher apa yang dibeli
					String tipeVoucher = request.getParameter("btnBeliA");
					if(tipeVoucher == null)
					{
						tipeVoucher = request.getParameter("btnBeliB");
						if(tipeVoucher == null)
						{
							tipeVoucher = request.getParameter("btnBeliC");
							tipe = "C";
							coin = 25000;
						}
						else
						{
							tipe = "B";
							coin = 15000;
						}
					}
					else
					{
						tipe = "A";
						coin = 10000;
					}


					Data data = new Data(path);
					Vector vVoucher = new Vector();

					//cek ud ada no itu lum, kalo ga null berarti ada maka perlu generate no lg
					boolean status = false;
					String noBaru = "";
					do{
						noBaru = tipe + generateVoucher();
						data.setVoucherData(2, "");
						vVoucher = data.getVoucherData();

						for(int i = 0; i < vVoucher.size(); i++)
						{
							Voucher voucher = (Voucher) vVoucher.get(i);
							if(voucher.getVoucherNumber().equals(noBaru))
							{
								status = true;
								break;
							}
						}
					}while(status);

					//insert no voucher yang baru
					try{
						Statement stmt = new doConnect(path).getStmt();
						stmt.executeUpdate("insert into msvoucher (voucherNumber, VoucherCoin, UserID, VoucherStatus) values ('"+noBaru+"', "+coin+", "+id+", "+0+")");
						response.sendRedirect("buy_vouchers.jsp?noVoucher="+noBaru);
					}catch(Exception e)
					{
						response.sendRedirect("buy_vouchers.jsp?errMsg="+e);
					}
				}
				catch(Exception e)
				{
					response.sendRedirect("buy_vouchers.jsp?errMsg2="+e);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request, response);
	}
}