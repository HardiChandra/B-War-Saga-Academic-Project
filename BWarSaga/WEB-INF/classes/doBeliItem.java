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

public class doBeliItem extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        try {

					String userid=request.getParameter("userID");
					String itemid=request.getParameter("txtID");
					String qty=request.getParameter("txtQty");
					boolean statusQty=false,statusUpdate=false;
					int intQty=0;

					String path=request.getParameter("path");
					doConnect dc=new doConnect(path);

					try{
						intQty=Integer.parseInt(qty);
						statusQty=true;
					}
					catch(Exception e)
					{
						statusQty=false;
					}

					if(userid==null||itemid==null||qty==null||qty.length()==0)
					{
						response.sendRedirect("set_item_qty.jsp?itemID="+itemid+"&err=harus diisi");
						return;
					}
					else
					if(statusQty==false)
					{
						response.sendRedirect("set_item_qty.jsp?itemID="+itemid+"&err=harus diisi angka");
						return;
					}
					else
					{
						Data data=new Data(path);
						Vector vec=new Vector();
						Item item=new Item();
						User user=new User();

						data.setItemData(1,itemid);
						vec=data.getItemData();
						item=(Item)vec.get(0);

						data.setUserData(1,userid);
						vec=data.getUserData();
						user=(User)vec.get(0);



						if(user.getUserCoin()>=(item.getItemCoin()*intQty))
						{
							//out.print("sukses");
							if(item.getItemQty()>=intQty)
								statusUpdate=true;
							else
							{
								statusUpdate=false;
								response.sendRedirect("set_item_qty.jsp?itemID="+itemid+"&barang tidak tersedia");
							}
						}
						else
						{
							//out.print("kurang duit");
							statusUpdate=false;
							response.sendRedirect("set_item_qty.jsp?itemID="+itemid+"&err=duit kurang");
						}

						if(statusUpdate==true)
						{
							Statement stmt=dc.getStmt();
							int itemQty=item.getItemQty()-intQty;
							int coin=user.getUserCoin()-(item.getItemCoin()*intQty);

							DateFormat df = DateFormat.getDateTimeInstance();
							Date date=new Date();
							stmt.executeUpdate("update msitem set itemqty="+itemQty+" where itemid="+item.getItemID()+"");
							stmt.executeUpdate("update msuser set usercoin="+coin+" where userid="+user.getUserID()+"");
							stmt.executeUpdate("insert into MsShopping values("+item.getItemID()+","+user.getUserID()+",'"+(String)df.format(date)+"',"+intQty+")");
							dc.getCon().close();
							response.sendRedirect("item_mall.jsp");

						}
					}
		        }catch(Exception e){out.println(e);

		        } finally {
		            out.close();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }



}
