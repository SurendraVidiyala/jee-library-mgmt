package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	Connection con=null;
	public Connection getConnection()
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","lms","lms");
		} catch (ClassNotFoundException e) {
			System.out.println("server problem... please  try later..");
		}
		catch (SQLException e) {
			System.out.println("server problem... please  try later..");
		}
                System.out.println("success");
		return con;
	}
        
        public static void main(String[] args) {
        DBUtil util=new DBUtil();
        Connection con=util.getConnection();
    }
}
