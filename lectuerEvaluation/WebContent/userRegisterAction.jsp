<!-- userRegister페이지에서 user정보를 받아 DB에 등록하는 Action이다. -->    

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@ page import = "user.userDTO" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="util.SHA256" %>
<%@ page import ="java.io.PrintWriter" %> <%-- 자바코드안에서 html문구를 실행할 때 사용 --%>

<% 
	request.setCharacterEncoding("UTF-8"); //form에서 post로 받는 정보들을 어떻게 포맷팅 할것이냐.
	
	String userId = "";
	String userPassword = "";
	String userEmail = "";
	
	if(request.getParameter("userId") != "") {
		userId = request.getParameter("userId");
	}
	if(request.getParameter("userPassword") != "") {
		userId = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != "") {
		userId = request.getParameter("userEmail");
	}
	
	if( userId.equals("") || userPassword.equals("") || userEmail.equals("") ){
		PrintWriter script = response.getWriter(); //웹브라우저에 응답할 객체인 response의 getWriter인스턴스를 활용하여 웹페이지에 실제로 반응을 해보자.
		script.println("<script>");
		script.println("alert('입력이 안된 정보가 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		userDAO dao = new userDAO();
		userDTO user = new userDTO(userId, userPassword, userEmail, SHA256.getSHA256(userEmail), false);
		
		int res = dao.userRegister(user);
		if(res == -1) { //정보 입력 다했는데 실패
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('회원가입 실패입니다. 이미 존재하는 아이디일 수 있습니다');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else { //성공
			
			session.setAttribute("userId", userId); //session에 "userId"라는 이름으로 userId를 할당한다. 세션에 할당함으로써 다른 페이지로 이동해도 그 정보가 그대로 남아있게 된다.
			//여기서는 이메일 인증 페이지로 이동할 것이므로 로그인된 상태로 페이지 창을 띄우기 위해 사용되는 것이다.		
			
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('회원가입 성공');");
			script.println("location.href='emailSent.jsp';");
			script.println("</script>");
			script.close();
		}
		
	}
	
	
	
%>