<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="evaluation.EvaluationDTO"%>

<%@ page import="evaluation.EvaluationDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");



	String userID = "";

	if(session.getAttribute("userID") != "") {

		userID = (String) session.getAttribute("userID");

	}

	if(userID == "") {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'userLogin.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	request.setCharacterEncoding("UTF-8");

	String lectureName = "";

	String professorName = "";

	int lectureYear = 0;

	String semesterDivide = "";

	String lectureDivide = "";

	String evaluationTitle = "";

	String evaluationContent = "";

	String totalScore = "";

	String creditScore = "";

	String comfortableScore = "";

	String lectureScore = "";

	if(request.getParameter("lectureName") != "") {

		lectureName = (String) request.getParameter("lectureName");

	}

	if(request.getParameter("professorName") != "") {

		professorName = (String) request.getParameter("professorName");

	}

	if(request.getParameter("lectureYear") != "") {

		try {

			lectureYear = Integer.parseInt(request.getParameter("lectureYear"));

		} catch (Exception e) {

			System.out.println("강의 연도 데이터 오류");

		}

	}

	if(request.getParameter("semesterDivide") != "") {

		semesterDivide = (String) request.getParameter("semesterDivide");

	}

	if(request.getParameter("lectureDivide") != "") {

		lectureDivide = (String) request.getParameter("lectureDivide");

	}

	if(request.getParameter("evaluationTitle") != "") {

		evaluationTitle = (String) request.getParameter("evaluationTitle");

	}

	if(request.getParameter("evaluationContent") != "") {

		evaluationContent = (String) request.getParameter("evaluationContent");

	}

	if(request.getParameter("totalScore") != "") {

		totalScore = (String) request.getParameter("totalScore");

	}

	if(request.getParameter("creditScore") != "") {

		creditScore = (String) request.getParameter("creditScore");

	}

	if(request.getParameter("comfortableScore") != "") {

		comfortableScore = (String) request.getParameter("comfortableScore");

	}

	if(request.getParameter("lectureScore") != "") {

		lectureScore = (String) request.getParameter("lectureScore");

	}

	if (lectureName == "" || professorName == "" || lectureYear == 0 || semesterDivide == "" ||

			lectureDivide == "" || evaluationTitle == "" || evaluationContent == "" || totalScore == "" ||

			creditScore == "" || comfortableScore == "" || lectureScore == "" ||

			evaluationTitle.equals("") || evaluationContent.equals("")) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	} else {

		EvaluationDAO evaluationDAO = new EvaluationDAO();

		int result = evaluationDAO.write(new EvaluationDTO(0, userID, lectureName, professorName, lectureYear,

				semesterDivide, lectureDivide, evaluationTitle, evaluationContent,

				totalScore, creditScore, comfortableScore, lectureScore, 0));

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('평가 등록에 실패했습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

			return;

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = './index.jsp';");

			script.println("</script>");

			script.close();

			//return;

		}

	}

%>


