package BaseConnectLib;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class BaseConnection {

	/*public static void main(String[] args) {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Found");
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("Driver Not Found"+e);
		}
		Connection con= null;

	    try 
	    {
	    	con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql");
	    	Statement st=(Statement) con.createStatement();
	    	System.out.println("Connected Successfully");
		}
	    catch (SQLException e) 
	    {
	    	System.out.println("Not Connected");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	 public Connection getConnection() {
		   try {
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("Driver Found");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Not Found"+e);
		}
	    Connection con = null;
		try {
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/avenjars","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return con;
		 }

}
