<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "user.UserDTO"%>
<%@ page import = "user.UserDAO" %>

<%@ page import ="util.Gmail" %>
<%@ page import ="util.SHA256"%>


<%@ page import ="java.io.PrintWriter" %>

<% 

	request.setCharacterEncoding("UTF-8");

	String userID = "";
	String userPassword = "";
	String userEmail = "";
	
	if(request.getParameter("userID") != ""){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != ""){
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != ""){
		userEmail = request.getParameter("userEmail");
	}

	if(userID == "" || userPassword == "" || userEmail == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸을 채워주세요.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false ) );
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			System.out.println(userID);
			System.out.println(userPassword);
			System.out.println(userEmail);
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 이거나 오류입니다..')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println(" location.href='emailSendAction.jsp'; ");
			script.println("</script>");
			script.close();
		}
	}
	
	
	
%>