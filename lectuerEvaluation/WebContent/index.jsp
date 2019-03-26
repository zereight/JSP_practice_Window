
<%@page import="java.net.URLEncoder"%>
<%@page import="evaluation.EvaluationDAO"%>
<%@page import="evaluation.EvaluationDTO"%>
<%@page import="user.userDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.userDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

<%
	request.setCharacterEncoding("UTF-8");
	String lectureDivide = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	
	if(request.getParameter("lectureDivide") !=null){
		lectureDivide = request.getParameter("lectureDivide");
	}
	if(request.getParameter("searchType") !=null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") !=null){
		search = request.getParameter("search");
	}
	if( request.getParameter("pageNumber") != null ){
		try{
			
			pageNumber = Integer.parseInt( request.getParameter("pageNumber") );
			
		}catch(Exception e) {
			PrintWriter p = response.getWriter();
			p.println("<script>");
			p.println("alert('검색 페이지번호 오류입니다.');");
			p.println("</script>");
			p.close();
		}
	}
	
	
	String userId= null;
	
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
	}
	
	
	
%>


    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand" href="./index.jsp">강의평가 웹 사이트</a>
        <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="./index.jsp">메인 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">회원정보</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
<% if(userId == null){ %>
                        <a class="dropdown-item" href="./login.jsp">로그인</a>
                        <a class="dropdown-item" href="./userRegister.jsp">회원가입</a>
<%} else {%>
                        <a class="dropdown-item" href="./logout.jsp">로그아웃</a>
<% } %>
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
        <form action="./index.jsp" method="get" class="form-inline mt-5">
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
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
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
                        <form method="post" action="./evaluationRegisterAction.jsp">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>강좌명</label>
                                        <input type="text" class="form-control" name="lectureName" id="" aria-describedby="helpId"
                                            placeholder="강좌명을 입력하세요">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>교수명</label>
                                        <input type="text" class="form-control" name="professorName" id="" aria-describedby="helpId"
                                            placeholder="교수명을 입력하세요">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>수강년도</label>
                                        <select class="form-control form-control-sm" name="lectureYear" id="">
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019" selected>2019</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>수강학기</label>
                                        <select class="form-control form-control-sm" name="semesterDivide" id="">
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
                                        <select class="form-control form-control-sm" name="lectureDivide" id="">
                                            <option selected value="전공">전공</option>
                                            <option value="교양">교양</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
							<div class="row">
                                <div class="form-group col">
                                    <label>제목</label>
                                    <input type="text" class="form-control" name="evaluationTitle" id="">
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="form-group col">
                                    <label>내용</label>
                                    <textarea class="form-control" name="evaluationContent" id="" rows="3" style="height:180px;"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label>종합</label>
                                        <select class="form-control" name="totalScore" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>성적</label>
                                        <select class="form-control" name="creditScore" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>프리한정도</label>
                                        <select class="form-control" name="comfortableScore" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>강의</label>
                                        <select class="form-control" name="lectureScore" id="">
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="F">F</option>
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
    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
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
                        <form action="./reportAction.jsp" method="post">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>제목</label>
                                        <input type="text" class="form-control" name="reportTitle" id="" aria-describedby="helpId"
                                            placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" name="reportContent" id="" rows="3" style="height:180px;"></textarea>
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

<%

	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	
	evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);
	
	if( evaluationList != null ){
		for (int i=0 ; i< evaluationList.size(); ++i){
			if(i==5) {break;}
			
			EvaluationDTO evaluation = evaluationList.get(i);
	

%>
    <div class="container" style="height: 250px;">
        <div class="card my-2">
            <div class="card-body">
                <h4 class="card-title"> <%= evaluation.getLectureName() %>> </h4>
                <small>교수명: <%= evaluation.getProfessorName() %>><span> <%= userId %>> </span></small>
                <hr>
                <h5 class="card-title">
		            <%=evaluation.getEvaluationTitle()%>&nbsp;<small>(<%=evaluation.getLectureYear()%>년 <%=evaluation.getSemesterDivide()%>)</small>
		        </h5>
                <p class="card-text py-2"> <%= evaluation.getEvaluationContent() %> </p>
                <div class="row">
	                    <div class="col-6">
				                        종합: <span><%= evaluation.gettotalScore() %></span>
				                        성적: <span><%= evaluation.getCreditScore() %></span>
				                        프리한정도: <span><%= evaluation.getcomfortableScore() %></span>
				                        강의: <span><%= evaluation.getLectureScore() %></span>
	                    </div>
	                    <div class="col-3 text-right">
			                	 좋아요: <span>(<%= evaluation.getLikeCount() %>)</span>
	                   </div>
	                   <div class="col-3 text-right">

			              <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=<%=evaluation.getEvaluationId()%>">추천</a>
			
			              <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%=evaluation.getEvaluationId()%>">삭제</a>
			
			            </div>
                </div>
            </div>
        </div>
      </div>
<%
		}
	
%>


	<ul class="pagination justify-content-center mt-3">

      <li class="page-item">

<%
	if(pageNumber <= 0) {
%>     

        <a class="page-link disabled">이전</a>

<%
	} else {
%>

		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber - 1%>">이전</a>

<%
	}
%>

      </li>

      <li class="page-item">

<%
	if(evaluationList.size() < 6) {
%>     

        <a class="page-link disabled">다음</a>

<%
	} else {
%>

		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber + 1%>">다음</a>

<%
	}
	}
%>

      </li>

    </ul>

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