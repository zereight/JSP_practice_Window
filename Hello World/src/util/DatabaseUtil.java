package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	//db와의 연결에 사용할 함수들 정의
	
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/TUTORIAL?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword ="root";
			Class.forName( "com.mysql.cj.jdbc.Driver" );
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
}
