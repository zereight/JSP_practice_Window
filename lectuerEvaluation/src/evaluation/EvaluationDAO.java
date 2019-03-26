package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			p.setString(9, dto.gettotalScore() );
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
	
	public ArrayList<EvaluationDTO> getList(String lectureDivide, String searchType, String search, int pageNumber){
		if(lectureDivide.equals("전체")) {
			lectureDivide = "";
		}
		
		ArrayList<EvaluationDTO> evaluationList = null;
		
		Connection conn = null;
		PreparedStatement p = null;
		ResultSet res = null;
		
		String sql = "";
		
		try {
			if( searchType.equals("최신순") ) {
				sql = "SELECT * FROM EVALUATION WHERE lectureName LIKE ? AND CONCAT( lectureName, professorName, evaluationTitle, evaluationContent ) LIKE ? ORDER BY evaluationID DESC LIMIT "+
					pageNumber*5 + ", "+pageNumber*5 + 6;
			}else if(searchType.equals("추천순")) {
				sql = "SELECT * FROM EVALUATION WHERE lectureName LIKE ? AND CONCAT(lectureName, professorName, evaluationTitle, evaluationContent) LIKE ? ORDER BY likeCount DESC LIMIT " + pageNumber*5 + ", " + 
						pageNumber*5+6;
			}
			
			conn = DatabaseUtil.getConnection();
			
			p = conn.prepareStatement(sql);
			p.setString(1, "%"+lectureDivide+"%");
			p.setString(2, "%"+search+"%");
			
			res = p.executeQuery();
			
			evaluationList = new ArrayList<EvaluationDTO>();
			while(res.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
							res.getInt(1),
							res.getString(2),
							res.getString(3),
							res.getString(4),
							res.getInt(5),
							res.getString(6),
							res.getString(7),
							res.getString(8),
							res.getString(9),
							res.getString(10),
							res.getString(11),
							res.getString(12),
							res.getString(13),
							res.getInt(14)
						);
				evaluationList.add(evaluation);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn!=null ) {conn.close();}}catch (Exception e){e.printStackTrace();}
			try{if(p!=null ) {p.close();}}catch (Exception e){e.printStackTrace();}
			try{if(res!=null ) {res.close();}}catch (Exception e){e.printStackTrace();}
		}
		
		
		return evaluationList;
		
	}
	
	
	
}
