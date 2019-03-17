<%@page import="global.Global_var"%>
<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="user.UserDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

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

	String reportTitle = "";

	String reportContent = "";

	if(request.getParameter("reportTitle") != "") {

		reportTitle = (String) request.getParameter("reportTitle");

	}

	if(request.getParameter("reportContent") != "") {

		reportContent = (String) request.getParameter("reportContent");

	}

	if (reportTitle == "" || reportContent == "") {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	}

	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:8080/OriginalCode/"; //OriginalCode 는 사용자에 맞게 바꿔주세요.

	String from = Global_var.getMyEmail();

	String to = Global_var.getAdminEmail();

	String subject = "강의평가 사이트에서 접수된 신고 메일입니다.";

	String content = "신고자: " + userID + "<br>제목: " + reportTitle + "<br>내용: " + reportContent;

	

	// SMTP에 접속하기 위한 정보를 기입합니다.

	Properties p = new Properties();

	p.put("mail.smtp.user", from);

	p.put("mail.smtp.host", "smtp.googlemail.com");

	p.put("mail.smtp.port", "465");

	p.put("mail.smtp.starttls.enable", "true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	 

	try{

	    Authenticator auth = new Gmail();

	    Session ses = Session.getInstance(p, auth);

	    ses.setDebug(true);

	    MimeMessage msg = new MimeMessage(ses); 

	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);

	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);

	    msg.addRecipient(Message.RecipientType.TO, toAddr);

	    msg.setContent(content, "text/html;charset=UTF-8");

	    Transport.send(msg);

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('오류가 발생했습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('정상적으로 신고되었습니다.');");

	script.println("history.back();");

	script.println("</script>");

	script.close();		

    //return;

%>


