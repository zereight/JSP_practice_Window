<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();
%>

<script>
	
	//alert("로그이웃되었습니다.");
	location.href = 'index.jsp';
	
</script>