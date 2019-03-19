package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class userDAO {

	
	
	//로그인함수
	public int login( String userId, String userPassword ) {
		
		Connection conn= null;
		ResultSet res = null;
		PreparedStatement p = null;
		
		String sql = "SELECT userPassword FROM USER WHERE userId= ? ";
		
		try {
			conn = DatabaseUtil.getConnection(); //DB와 통신할 수 있는 객체를 만들고
			p = conn.prepareStatement(sql); //DB명령문을 실행할 변수를 만들고, 아직 정해지지 않는 명령문을 할당.
			p.setString(1, userId); //정해지지 않는 ? 부분에 값을 할당.
			res = p.executeQuery(); //SELECT구문으로 DB에서 불러오고 그것의 레코드 값 저장.
			
			if(res.next()) { //다음 행이  있는가 (처음실행시 첫번쨰 행)
				if(res.getString(1).equals(userPassword)) { //있다면 그 1번쨰 행의 값을 String형으로 반환후,  userPassword와 비교 (java에서는 문자열 비교할때 equals사용 ==는 문자열의 주소값 비교)
					return 1; //로그인을 성공
				} else {
					return 0; //비밀번호가 틀림.
				}
			
			} else {
				return -1; //해당하는 user가 없음.
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //메모리 해제를 해준다 gc에 대한 맹목적인 믿음은 피하자!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -2; //DB자체 에러
		
	}
	
	//회원가입 함수.
	public int userRegister( userDTO user ) {
		Connection conn = null;
		PreparedStatement p = null;
		
		String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, user.getUserID());
			p.setString(2, user.getUserPassword());
			p.setString(3, user.getUserEmail());
			p.setString(4, user.getUserEmailHash());
			
			return p.executeUpdate(); //업데이트 성공한 양을 반환 여기서는 1이면 성공
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //메모리 해제를 해준다 gc에 대한 맹목적인 믿음은 피하자!
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1; //회원가입 실패
	}
	
	//userId로 userEmail을 찾아서 반환하는 함수 이메일보낼때 쓰임
	public String getUserEmail(String userId) {
		Connection conn = null;
		ResultSet res = null;
		PreparedStatement p= null;
		
		String sql = "SELECT userEmail FROM USER WHERE userId = ? ";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			res = p.executeQuery();
			
			if(res.next()) {
				return res.getString(1); //String형으로 반환
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //메모리 해제를 해준다 gc에 대한 맹목적인 믿음은 피하자!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	
	//userId로 그 아이디가 EmailChecked 되었는지 반환하는 함수
	public boolean getUserEmailChecked(String userId) {
		
		Connection conn = null;
		ResultSet res = null;
		PreparedStatement p = null;
		
		String sql = "SELECT userEmailChecked FROM USER WHERE userId = ?";
		
		
		try {
		
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			
			res = p.executeQuery();
			
			if(res.next()) {
				return res.getBoolean(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //메모리 해제를 해준다 gc에 대한 맹목적인 믿음은 피하자!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		
		return false;
	}
	
	
	//userid로 그 아이디의 EmailChecked를 true로 바꿔주는 함수
	public int setUserEmailChecked(String userId) {
		Connection conn = null;
		PreparedStatement p = null;
		
		String sql = "UPDATE USER SET userEmailChecked = true WHERE userId = ? ";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			
			return p.executeUpdate(); //업데이트 성공하면 양의정수 반환
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //메모리 해제를 해준다 gc에 대한 맹목적인 믿음은 피하자!
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //업데이트 실패
	}
	
	
	
}
