package likey;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import util.DatabaseUtil;



public class LikeyDAO {
	

	public int like(String userID, String evaluationID, String userIP) {

		Connection conn = null;
		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";

		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setString(2, evaluationID);

			pstmt.setString(3, userIP);

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if(conn != null) {try {
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}}
		}

		return -1; // 추천 중복 오류

	}

	

}


