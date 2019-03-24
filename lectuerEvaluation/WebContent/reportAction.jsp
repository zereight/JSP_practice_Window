
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="util.Gmail"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="user.userDAO"%>
<%@page import="util.AdminInfo"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
	}
	
	if (userId == null){
		PrintWriter s = response.getWriter();
		s.println("<script>");
		s.println("alert('로그인을 해주세요.');");
		s.println("location.href='./login.jsp';");
		s.println("</script>");
		s.close();
		return;
	}


	request.setCharacterEncoding("UTF-8");

	String reportTitle = null;
	String reportContent= null;
	
	if( request.getParameter("reportTitle") != null){
		reportTitle = (String) request.getParameter("reportTitle");
	}
	
	if( request.getParameter("reportContent") != null){
		reportContent = (String) request.getParameter("reportContent");
	}
	
	if(reportTitle == null || reportContent==null){
		PrintWriter s = response.getWriter();
		s.println("<script>");
		s.println("alert('입력이 안된 정보가 있습니다.')");
		s.println("</script>");
		s.close();
		return;
	} else {
		
		String host = "http://localhost:8080/lectureEvaluation/";
		String from = new AdminInfo().getAdminEmailId(); 
		String to = "신고받아볼 이메일";
		
		String title = reportTitle;
		String content = 
				"<p><h1>"+userId+"</h1>"+" 님께서 작성해주신 신고접수메일입니다.</p><br>"+
				reportContent;
				
		//SMPT에 접속하기 위한 과정
		Properties p = new Properties(); 
		p.put("mail.smtp.user", from); //보내는 사람은 admin
		p.put("mail.smtp.host", "smtp.googlemail.com"); //구글 메일서버사용
		p.put("mail.smtp.port",465); //구글 서비스는 465
		p.put("mail.smtp.starttls.enable", "true"); //
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true"); //
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			MimeMessage msg = new MimeMessage(ses);
			
			msg.setSubject(title);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(to);
			
			msg.addRecipient(Message.RecipientType.TO , toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(msg);
			
			PrintWriter s = response.getWriter();
			s.println("<script>");
			s.println("alert('신고가 정상적으로 접수되었습니다.')");
			s.println("location.href = './index.jsp' ");
			s.println("</script>");
			s.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	return;
	
%>