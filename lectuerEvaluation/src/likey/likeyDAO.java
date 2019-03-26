package likey;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class likeyDAO {
	public int like(String userId, int evaluationId, String userIp) {
		
		Connection conn = null;
		String sql = "INSERT INTO LIKEY VALUES(?, ?, ?)";
		PreparedStatement p = null;
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			
			p.setString(1, userId);
			p.setInt(2, evaluationId);
			p.setString(3, userIp);
			
			return p.executeUpdate(sql);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null) {conn.close();} }catch(Exception e) {e.printStackTrace();}
			try { if(p!=null) {p.close();} }catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
}
