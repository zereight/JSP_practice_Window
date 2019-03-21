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
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="F">F</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>성적</label>
                                        <select class="form-control" name="" id="">
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
                                        <select class="form-control" name="" id="">
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
                                        <select class="form-control" name="" id="">
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

        <div class="container-fluid p-5 border-primary bg-light mt-5" style="border-radius: 5%;">

            <form action="./userRegisterAction.jsp" method="post">
                <div class="row flex-column ">
                    <div class="col-auto text-center ">회원가입 하기</div>

                    <div class="col form-group">
                            <label>이메일</label>
                            <input type="email" class="form-control" name="userEmail" id="" aria-describedby="helpId" placeholder="이메일">
                        </div>
                    
                    <div class="col form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" name="userId" id="" aria-describedby="helpId" placeholder="아이디">
                    </div>

                    <div class="col form-group">
                        <label>비밀번호</label>
                        <input type="password" class="form-control" name="userPassword" id="" aria-describedby="helpId" placeholder="비밀번호">
                        
                    </div>

                    <div class="col form-group">
                        <label>비밀번호 확인</label>
                        <input type="password" class="form-control" name="userPasswordAgain" id="" aria-describedby="helpId" placeholder="비밀번호 확인">
                        
                        <% if(session.getAttribute("errMsg") != null){  %>
                        <small> <%= session.getAttribute("errMsg") %> </small>
                        <%}  %>
                        
                        
                    </div>
                    

                    
                        <button type="submit" class="btn btn-primary" style="width:100%;">회원가입</button>
                    
                </div>
            </form>


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