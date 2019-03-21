<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="util.Gmail"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="util.SHA256"%>
<%@page import="util.AdminInfo"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%-- 회원가입은 완료되었지만, 이메일인증을 해야하기 때문에, 이메일을 전송해주는 페이지입니다. --%>

<%
	userDAO dao = new userDAO();
	String userId = null;
	if(session.getAttribute("userId") != null){ //userRegisterAction에서 userId를 session에 저장했는데 그것을 꺼내오는 과정이다.
		userId =(String) session.getAttribute("userId");
	}
	
	if(userId == null) { //세션에서도 받아왔는데 없다면
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');"); //
		script.println(" location.href('./login.jsp');" );
		script.println("</script>");
		script.close();
		return ;
	}
	
	boolean emailChecked = (new userDAO()).getUserEmailChecked(userId);
	
	if(emailChecked == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 이메일 인증이 된 유저입니다.');");
		script.println("location.href('./index.jsp')");
		script.println("</script>");
		script.close();
		return;
	}
	
	//사용자에게 보낼 메세지를 입력합니다.
	String host = "http://localhost:8080/lectuerEvaluation/";
	String from = (new AdminInfo()).getAdminEmailId();
	String to = (new userDAO()).getUserEmail(userId);
	
	String title = "강의평가 사이트 이메일 인증 요망";
	String content = "아래 링크로 접속하여 이메일 인증을 완료하세요." + 
		"<a href=" + host + "emailAuthenticated.jsp?code=" + SHA256.getSHA256(to) +"> 이메일인증하기 </a>";
		
	
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
		Session ses = Session.getInstance(p,auth);
		MimeMessage msg = new MimeMessage(ses);
		
		msg.setSubject( title );
		
		Address fromAddr = new InternetAddress(from);
		
		msg.setFrom(fromAddr);
		
		Address toAddr = new InternetAddress(to);
		
		msg.addRecipient( Message.RecipientType.TO , toAddr);
		
		msg.setContent(content, "text/html;charset=UTF-8");
		
		Transport.send(msg);
		
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	
%>


<!doctype html>
<html style="height:100%;">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <link rel="stylesheet" href="./css/custom.css">

    <title>강의 평가 웹사이트</title>
</head>

<body>


    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand" href="./index.jsp">강의평가 웹 사이트</a>
        <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#">메인 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">회원정보</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="./login.jsp">로그인</a>
                        <a class="dropdown-item" href="./userRegister.jsp">회원가입</a>
                        <a class="dropdown-item" href="./logout.jsp">로그아웃</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
        </div>
    </nav>

    <div class="container mt-3">
        <form action="./index.jsp" method="get" class="form-inline">
            <select name="" id="" class="form-control">
                <option selected value="전체">전체</option>
                <option value="전공">전공</option>
                <option value="교양">교양</option>
                <option value="기타">기타</option>
            </select>

            <select name="" id="" class="form-control  mx-2">
                <option selected value="최신순">최신순</option>
                <option value="추천순">추천순</option>
            </select>


            <input type="text" class="form-control" name="" id="" aria-describedby="helpId" placeholder="내용을 입력하세요">


            <button type="submit" class="btn btn-primary  mx-1">검색</button>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registerModal">
                글올리기
            </button>


            <button type="button" class="btn btn-danger  mx-2" data-toggle="modal" data-target="#reportModal">
                신고하기
            </button>

        </form>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">글 올리기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form action="post" action="">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>강좌명</label>
                                        <input type="text" class="form-control" name="" id="" aria-describedby="helpId"
                                            placeholder="강좌명을 입력하세요">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>교수명</label>
                                        <input type="text" class="form-control" name="" id="" aria-describedby="helpId"
                                            placeholder="교수명을 입력하세요">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>수강년도</label>
                                        <select class="form-control form-control-sm" name="" id="">
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>수강학기</label>
                                        <select class="form-control form-control-sm" name="" id="">
                                            <option value="1학기">1학기</option>
                                            <option value="여름학기">여름학기</option>
                                            <option value="2학기">2학기</option>
                                            <option value="겨울학기">겨울학기</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>강의구분</label>
                                        <select class="form-control form-control-sm" name="" id="">
                                            <option selected value="전공">전공</option>
                                            <option value="교양">교양</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col">
                                    <label>내용</label>
                                    <textarea class="form-control" name="" id="" rows="3" style="height:180px;"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label>종합</label>
                                        <select class="form-control" name="" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option valiue="C">C</option>
                                            <option valiue="D">D</option>
                                            <option valiue="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>성적</label>
                                        <select class="form-control" name="" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option valiue="C">C</option>
                                            <option valiue="D">D</option>
                                            <option valiue="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>프리한정도</label>
                                        <select class="form-control" name="" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option valiue="C">C</option>
                                            <option valiue="D">D</option>
                                            <option valiue="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>강의</label>
                                        <select class="form-control" name="" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option valiue="C">C</option>
                                            <option valiue="D">D</option>
                                            <option valiue="F">F</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                <button type="submit" class="btn btn-primary">등록</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">신고하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form action="" method="post">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>제목</label>
                                        <input type="text" class="form-control" name="" id="" aria-describedby="helpId"
                                            placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" name="" id="" rows="3" style="height:180px;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                <button type="submit" class="btn btn-primary">등록하기</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="container" style="height: 550px;">

        <div class="container-fluid p-5 border-info bg-info mt-5" style="border-radius: 5%; color:white; font-weight: 300; font-size: 1.5em;">

            <span> 이메일이 전송되었습니다. 이메일을 확인 후 링크를 통해 인증을 진행해 주세요! </span>

        </div>

    </div>

    <footer class="footer text-center bg-dark" style="color: white;">
        <div class="container">
            <div class="row justify-content-between align-content-center " style="height:200px;">
                <div class="col">
                    <div class="mb-3" style="font-weight: 800;">위치</div>
                    <span> 주소 XXX시 XXX구 XXX동 XXX아파트 XXX호</span>
                </div>
                <div class="col">
                    <div class="mb-5" style="font-weight: 800;">SNS</div>
                    <span>
                        <a href="#" class="mx-3">페이스북</a>
                        <a href="#" class="mx-3">인스타그램</a>
                        <a href="#" class="mx-3">트위터</a>
                    </span>
                </div>
                <div class="col">
                    <div class="mb-3" style="font-weight: 800;">About</div>
                    <span>테스트용 사이트입니다.</span>
                </div>
            </div>
        </div>
    </footer>

    <div class="container-fluid">

        <div class="row justify-content-center align-content-center text-uppercase" style="background-color: black; height: 100px; color: white;">
            <div class="col-auto">
                Copyright @ 김대현 All right reserved.
            </div>

        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>