package servlet;

import java.sql.*;

public class doConnect {

	Connection con;
	Statement stmt;

	public doConnect(String path)
	{
		try{
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con = DriverManager.getConnection("jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+path);
					stmt = con.createStatement(1004, 1008);

		}catch(Exception e){}
	}

	public Statement getStmt()
	{
		return stmt;
	}

	public Connection getCon()
	{
		return con;
	}
}