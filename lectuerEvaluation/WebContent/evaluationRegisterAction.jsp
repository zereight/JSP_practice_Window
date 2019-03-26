<%@page import="user.userDAO"%>
<%@page import="evaluation.EvaluationDAO"%>
<%@page import="evaluation.EvaluationDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");

	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null){
		PrintWriter s = response.getWriter();
		s.println("<script>");
		s.println("alert('로그인을 먼저 해주세요.');");
		s.println("location.href='./login.jsp'");
		s.println("</script>");
		s.close();
	}
	
	boolean emailchecked = new userDAO().getUserEmailChecked(userId);
	
	if(emailchecked == false){
		PrintWriter p = response.getWriter();
		p.println("<script>");
		p.println("alert('이메일 인증 후에 게시글 등록이 가능합니다.');");
		p.println("location.href='./emailSent.jsp'");
		p.println("</script>");
		p.close();
		return;
	}
	
	
 String lectureName=null;
 String professorName=null;
 int lectureYear=0;
 String semesterDivide=null;
 String lectureDivide=null;
 String evaluationTitle=null;
 String evaluationContent=null;
 String totalScore=null;
 String creditScore=null;
 String comfortableScore=null;
 String lectureScore=null;
 
 if(request.getParameter("lectureName")!=null){
	 lectureName= request.getParameter("lectureName");
 }
 if(request.getParameter("professorName")!=null){
	 professorName= request.getParameter("professorName");
 }
 if(request.getParameter("lectureYear")!=null){
	 try{
		 lectureYear= Integer.parseInt(request.getParameter("lectureYear"));
	 }catch(Exception e){
		 e.printStackTrace();
	 }
 }
 if(request.getParameter("semesterDivide")!=null){
	 semesterDivide= request.getParameter("semesterDivide");
 }
 if(request.getParameter("lectureDivide")!=null){
	 lectureDivide= request.getParameter("lectureDivide");
 }
 if(request.getParameter("evaluationTitle")!=null){
	 evaluationTitle= request.getParameter("evaluationTitle");
 }
 if(request.getParameter("evaluationContent")!=null){
	 evaluationContent= request.getParameter("evaluationContent");
 }
 if(request.getParameter("totalScore")!=null){
	 totalScore= request.getParameter("totalScore");
 }
 if(request.getParameter("creditScore")!=null){
	 creditScore= request.getParameter("creditScore");
 }
 if(request.getParameter("comfortableScore")!=null){
	 comfortableScore= request.getParameter("comfortableScore");
 }
 if(request.getParameter("lectureScore")!=null){
	 lectureScore= request.getParameter("lectureScore");
 }

 if( lectureName == null || professorName == null ||lectureYear == 0 ||semesterDivide == null ||lectureDivide == null ||evaluationTitle == null ||evaluationContent == null
		 ||totalScore == null ||creditScore == null ||comfortableScore == null ||lectureScore == null ){
	 
	
	 PrintWriter s = response.getWriter();
	 s.println("<script>");
	 s.println("alert('입력이 안된사항이 있습니다.');");
	 s.println("location.href='./index.jsp'");
	 s.println("</script>");
	 s.close();
	 
 } else {
	 
	 EvaluationDAO dao = new EvaluationDAO();
	 
	 int res = dao.write( new EvaluationDTO(0,userId,lectureName,professorName,lectureYear,semesterDivide,lectureDivide,
			 evaluationTitle,evaluationContent,totalScore,creditScore,comfortableScore,lectureScore,0) );
	 
	 if(res == -1){
		 PrintWriter s = response.getWriter();
		 s.println("<script>");
		 s.println("alert('평가등록에 실패하였습니다.');");
		 s.println("location.href='./index.jsp'");
		 s.println("</script>");
		 s.close();
		 return;
	 } else if(res==-2){
		 PrintWriter s = response.getWriter();
		 s.println("<script>");
		 s.println("alert('평가등록에 실패하였습니다. db오류');");
		 s.println("location.href='./index.jsp'");
		 s.println("</script>");
		 s.close();
		 return;
	 }
	 else {
		 PrintWriter s = response.getWriter();
		 s.println("<script>");
		 s.println("alert('평가등록에 성공하였습니다.');");
		 s.println("location.href='./index.jsp'");
		 s.println("</script>");
		 s.close();
		 return;
	 }
 }
 
	
%>
