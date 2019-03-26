<%@page import="likey.likeyDAO"%>
<%@page import="evaluation.EvaluationDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%!

	public static String getClientIp( HttpServletRequest request ){
		String ip = request.getHeader("X-FORWARDED-FOR"); //X-FORWARDED-FOR는 IP헤더 필드 중 하나로써 ClientIP식별하는 것에 사용된다.
		
		if(ip ==null || ip.length() ==0 ){
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0) {
	        ip = request.getRemoteAddr() ;
	    }
	    return ip;
	}

%>

<%

	String userId = null;
	if( session.getAttribute("userId") != null ){
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 먼저 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	
	request.setCharacterEncoding("UTF-8");
	
	
	String evaluationId = null;

	if(request.getParameter("evaluationID") != null) {
		evaluationId = (String) request.getParameter("evaluationID");
	}
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	likeyDAO likeyDAO = new likeyDAO();
	int result = likeyDAO.like(userId, Integer.parseInt(evaluationId), getClientIp(request));
	if (result == 1) {
		result = evaluationDAO.like(evaluationId);
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('추천이 완료되었습니다.');");
			script.println("location.href='index.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 추천을 누른 글입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		//return;
	}
	

%>
    
