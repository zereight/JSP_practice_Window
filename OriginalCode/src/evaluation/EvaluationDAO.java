package evaluation;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EvaluationDAO {

	public int write(EvaluationDTO evaluationDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO EVALUATION VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0);";
		try {

			conn = DatabaseUtil.getConnection();

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, evaluationDTO.getUserID().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));

			pstmt.setString(2, evaluationDTO.getLectureName().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));

			pstmt.setString(3, evaluationDTO.getProfessorName().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setInt(4, evaluationDTO.getLectureYear());


			pstmt.setString(5, evaluationDTO.getSemesterDivide().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(6, evaluationDTO.getLectureDivide().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(7, evaluationDTO.getEvaluationTitle().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(8, evaluationDTO.getEvaluationContent().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(9, evaluationDTO.getTotalScore().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(10, evaluationDTO.getCreditScore().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(11, evaluationDTO.getComfortableScore().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			pstmt.setString(12, evaluationDTO.getLectureScore().replaceAll("<", "&lt;").replaceAll(">", " &gt;")
					.replaceAll("\r\n", "<br>"));


			System.out.println(pstmt);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}

	public ArrayList<EvaluationDTO> getList(String lectureDivide, String searchType, String search, int pageNumber) {

		if (lectureDivide.equals("��ü")) {

			lectureDivide = "";

		}

		ArrayList<EvaluationDTO> evaluationList = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "";

		try {
			conn = DatabaseUtil.getConnection();
			if (searchType.equals("�ֽż�")) {

				SQL = "SELECT * FROM EVALUATION WHERE lectureDivide LIKE ? AND CONCAT(lectureName, professorName, evaluationTitle, evaluationContent) LIKE ? ORDER BY evaluationID DESC LIMIT "
						+ pageNumber * 5 + ", " + pageNumber * 5 + 6;

			} else if (searchType.equals("��õ��")) {

				SQL = "SELECT * FROM EVALUATION WHERE lectureDivide LIKE ? AND CONCAT(lectureName, professorName, evaluationTitle, evaluationContent) LIKE ? ORDER BY likeCount DESC LIMIT "
						+ pageNumber * 5 + ", " + pageNumber * 5 + 6;

			}

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, "%" + lectureDivide + "%");

			pstmt.setString(2, "%" + search + "%");

			rs = pstmt.executeQuery();

			evaluationList = new ArrayList<EvaluationDTO>();

			while (rs.next()) {

				EvaluationDTO evaluation = new EvaluationDTO(

						rs.getInt(1),

						rs.getString(2),

						rs.getString(3),

						rs.getString(4),

						rs.getInt(5),

						rs.getString(6),

						rs.getString(7),

						rs.getString(8),

						rs.getString(9),

						rs.getString(10),

						rs.getString(11),

						rs.getString(12),

						rs.getString(13),

						rs.getInt(14)

				);

				evaluationList.add(evaluation);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (rs != null)
					rs.close();

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return evaluationList;

	}

	// likey
	public int like(String evaluationID) {

		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "UPDATE EVALUATION SET likeCount = likeCount + 1 WHERE evaluationID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(evaluationID));

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}

	public int delete(String evaluationID) {

		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "DELETE FROM EVALUATION WHERE evaluationID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(evaluationID));

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}

	public String getUserID(String evaluationID) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "SELECT userID FROM EVALUATION WHERE evaluationID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(evaluationID));

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return null;

	}

}
