package bean;

import java.sql.*;
import java.util.*;

public class Data{

	Connection con;
	Statement stmt;
	Vector<User> vUser = new Vector<User>();
	Vector<Item> vItem = new Vector<Item>();
	Vector<Voucher> vVoucher = new Vector<Voucher>();
	Vector<Shopping> vShopping= new Vector<Shopping>();

	String path;

	public Data(String path){
		this.path = path;
	}

	public void connect()
	{
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+path);
			stmt = con.createStatement(1004, 1008);
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

	//setter
	public void setUserData(int flag, String userID)
	{
		try
		{
			String query = "select * from msuser where userid = ";
			//untuk view profile
			if(flag == 1)
			{
				query = query + userID;
			}
			//untuk admin search user
			else if(flag == 2)
			{
				query= query + "'%"+userID+"%'";
			}
			else if(flag == 3)
			{
				query="select * from msuser where username like '%"+userID+"%'";
			}

			connect();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				User user = new User();
				user.setUserID(rs.getInt("userid"));
				user.setUserName(rs.getString("username"));
				user.setUserPass(rs.getString("userpass"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getString("gender"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setCity(rs.getString("city"));
				user.setNama(rs.getString("nama"));
				user.setUserCoin(rs.getInt("usercoin"));

				vUser.add(user);
				//System.out.print(rs.getString("username") + " " + rs.getString("userpass") + " " + rs.getString("role") + " " + rs.getString("gender") + " " + rs.getString("phone") + " " + rs.getString("address") + " " + rs.getString("nama"));
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public void setItemData(int flag, String keyword)
	{
		try
		{
			String query = "";
			//untuk mencari item dengan keyword itemID
			if(flag == 1)
			{
				query = "select * from msItem where itemID = "+keyword+"";
			}
			//untuk mencari item dengan keyword itemName
			else if(flag == 2)
			{
				query = "select * from msItem where itemName like '%"+keyword+"%'";
			}
			connect();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				Item item = new Item();
				item.setItemID(rs.getInt("itemID"));
				item.setItemName(rs.getString("itemName"));
				item.setItemCoin(rs.getInt("itemCoin"));
				item.setItemQty(rs.getInt("itemQty"));
				item.setItemDesc(rs.getString("itemDesc"));

				vItem.add(item);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public void setShoppingData(String userID)
	{
		try
		{
			connect();
			ResultSet rs = stmt.executeQuery("select * from msShopping where userId = "+userID);
			while(rs.next())
			{
				//ambil data berdasarkan itemID yang didapat
				setItemData(1, rs.getString("itemID"));
				Shopping shop=new Shopping();
				shop.setItemID(rs.getInt("itemID"));
				shop.setUserID(rs.getInt("userID"));
				shop.setShoppingQty(rs.getInt("shoppingqty"));
				shop.setDateID(rs.getString("dateid"));
				vShopping.add(shop);
			}
			con.close();

		}
		catch(Exception e)
		{

		}
	}

	public void setVoucherData(int flag, String keyword)
	{
		try{
			String query = "";
			//untuk select voucher apa aj yang dimiliki user tertentu
			if(flag == 1)
			{
				query = "select * from msVoucher where userId = "+keyword;
			}
			//untuk select semua voucher yang ada
			//dipakai untuk mengecek noVoucher yang baru digenerate ud ada atau belum
			else if(flag == 2)
			{
				query = "select voucherNumber from msVoucher";
			}
			connect();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				Voucher voucher = new Voucher();
				voucher.setVoucherID(rs.getInt("voucherID"));
				voucher.setVoucherNumber(rs.getString("voucherNumber"));
				voucher.setVoucherCoin(rs.getInt("voucherCoin"));
				voucher.setUserID(rs.getInt("userID"));
				voucher.setVoucherStatus(rs.getInt("voucherStatus"));

				vVoucher.add(voucher);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	//getter
	public Vector getUserData()
	{
		return vUser;
	}

	public Vector getItemData()
	{
		return vItem;
	}

	public Vector getVoucherData()
	{
		return vVoucher;
	}

	public Vector getShoppingData()
	{
		return vShopping;
	}

}