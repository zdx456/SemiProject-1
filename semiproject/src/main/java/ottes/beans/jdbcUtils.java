package ottes.beans;


import java.sql.Connection;
import java.sql.DriverManager;



public class jdbcUtils {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kh", "kh");
		return con;
	}

}
