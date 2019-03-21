<%@page import="user.userDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	if(session.getAttribute("userId") != null){
    		PrintWriter s = response.getWriter();
    		s.println("<script>");
    		s.println("alert('이미 로그인 되어 있습니다.');");
    		s.println("location.href = 'index.jsp';");
    		s.println("</script>");
    		s.close();
    		return;
    	}
    
    
    	String userId = null;
    	String userPassword = null;
    	
    	if( request.getParameter("userId") != null ){
    		userId = (String) request.getParameter("userId");
    	}
    	if( request.getParameter("userPassword") != null ){
    		userPassword = (String) request.getParameter("userPassword");
    	}
    	
    	if( userId==null || userPassword==null ){
    		PrintWriter s = response.getWriter();
    		s.println("<script>");
    		s.println("alert('아이디 또는 비밀번호를 입력해주세요.');");
    		s.println("location.href = 'index.jsp';");
    		s.println("</script>");
    		s.close();
    		return;
    	} else {
    		
    		//DB에서 회원정보가 있는지 체크
    		try{
    			userDAO dao = new userDAO();
    			int res = dao.login(userId, userPassword);
    			
    			if(res == 1){
    				
    				session.setAttribute("userId", userId);
    				
    				PrintWriter s = response.getWriter();
    	    		s.println("<script>");
    	    		s.println("alert('로그인에 성공하였습니다.');");
    	    		s.println("location.href = 'index.jsp';");
    	    		s.println("</script>");
    	    		s.close();
    				
    			}else {
    				PrintWriter s = response.getWriter();
    	    		s.println("<script>");
    	    		s.println("alert('로그인에 실패하였습니다.');");
    	    		s.println("location.href = 'index.jsp';");
    	    		s.println("</script>");
    	    		s.close();
    			}
    			
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		
    	}
    	
    	
    %>