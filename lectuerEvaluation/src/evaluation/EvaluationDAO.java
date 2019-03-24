package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class EvaluationDAO {
	
	public int write (EvaluationDTO dto) {
		Connection conn = null;
		PreparedStatement p = null;
		String sql = "INSERT INTO EVALUATION VALUES(0,?,?,?,?,?,?,?,?,?,?,?,?,0);";
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, dto.getUserId() );
			p.setString(2, dto.getLectureName() );
			p.setString(3, dto.getProfessorName() );
			p.setInt(4, dto.getLectureYear() );
			p.setString(5, dto.getSemesterDivide() );
			p.setString(6, dto.getLectureDivide() );
			p.setString(7, dto.getEvaluationTitle() );
			p.setString(8, dto.getEvaluationContent() );
			p.setString(9, dto.getTotlaScore() );
			p.setString(10, dto.getCreditScore() );
			p.setString(11, dto.getcomfortableScore() );
			p.setString(12, dto.getLectureScore() );

			return p.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try{if(conn!=null) {conn.close();}}catch(Exception e) {e.printStackTrace();}
			try{if(p!=null) {p.close();}}catch(Exception e) {e.printStackTrace();}
		}
		return -2;
	}
	
	
	
}
