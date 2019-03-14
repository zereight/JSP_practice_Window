<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <title> 강의평가 웹 사이트 </title>
</head>

<body>

    <div class="container-fluid">
        <div class="row justify-content-between align-items-center p-4" style="background-color: rgb(187, 206, 171); font-weight: 800;">
            <div class="col">
                <div class="row">
                    <div class="col-auto" style="font-size: 1.3em;">강의평가 웹 사이트</div>
                    <div class="col-auto mt-1"><a href="index.jsp">메인</a> </div>
                    <div class="col-auto">
                        <div class="dropdown open">
                            <button class="btn dropdown-toggle p-1" type="button" id="triggerId" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                회원관리
                            </button>
                            <div class="dropdown-menu" aria-labelledby="triggerId">
                                <button class="dropdown-item" href="userLogin.jsp">로그인</button>
                                <button class="dropdown-item" href="userJoin.jsp">회원가입</button>
                                <button class="dropdown-item" href="userLogout.jsp">로그아웃</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col" style="text-align: right;">
                <form action="post">
                    <input type="search" name="" id="" aria-describedby="helpId" placeholder="">
                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
    </div>

    

    <div class="container">
        <div class="row">
            <form action="./index.jsp" method="get">
                <select name="property" id="">
                    <option value="전체" selected>전체</option>
                    <option value="전공">전공</option>
                    <option value="교양">교양</option>
                    <option value="기타">기타</option>
                </select>
                <input type="search" name="search_text" id="" aria-describedby="helpId" placeholder="">
                <input type="submit" value="검색">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#registerModalId">
                    등록하기
                </button>
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#reportModalId">
                    신고하기
                </button>
            </form>

        </div>

        <div class="card">
          <div class="card-header">
              <div class="row">
                  <div class="col text-left">
                        LectureTitle 1                      
                  </div>
                  <div class="col text-right">
                      <small>Author1</small>
                  </div>
              </div>
          </div>
          <div class="card-body">
            <h4 class="card-title">Title 1 <small>(2017년 summer학기)</small> </h4>
            <p class="card-text">
                ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
            </p>
            <div class="row">
                <div class="col text-left">
                    Grade <span style="color:red">A</span>
                    Free <span style="color:red">A</span>
                    Lecture <span style="color:red">A</span>
                    <span style="color: green;">(recommendation: 15)</span>
                </div>

                <div class="col text-right">
                    <a onclick="return confirm('Do you want to recommend?')" href="./likeAction.jsp?evaluationID=">Like</a>
                    <a onclick="return confirm('Do you want to delete?')" href="./likeAction.jsp?evaluationID=">Delete</a>
                </div>

            </div>

          </div>
        </div>

        <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col text-left">
                              LectureTitle 2                      
                        </div>
                        <div class="col text-right">
                            <small>Author2</small>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">Title 2 <small>(2018년 summer학기)</small> </h4>
                  <p class="card-text">
                      ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                  </p>
                  <div class="row">
                      <div class="col text-left">
                          Grade <span style="color:red">A</span>
                          Free <span style="color:red">A</span>
                          Lecture <span style="color:red">A</span>
                          <span style="color: green;">(recommendation: 15)</span>
                      </div>
      
                      <div class="col text-right">
                          <a onclick="return confirm('Do you want to recommend?')" href="./likeAction.jsp?evaluationID=">Like</a>
                          <a onclick="return confirm('Do you want to delete?')" href="./likeAction.jsp?evaluationID=">Delete</a>
                      </div>
      
                  </div>
      
                </div>
              </div>

              <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col text-left">
                                  LectureTitle 3                      
                            </div>
                            <div class="col text-right">
                                <small>Author3</small>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                      <h4 class="card-title">Title 3 <small>(2019년 summer학기)</small> </h4>
                      <p class="card-text">
                          ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                      </p>
                      <div class="row">
                          <div class="col text-left">
                              Grade <span style="color:red">A</span>
                              Free <span style="color:red">A</span>
                              Lecture <span style="color:red">A</span>
                              <span style="color: green;">(recommendation: 15)</span>
                          </div>
          
                          <div class="col text-right">
                              <a onclick="return confirm('Do you want to recommend?')" href="./likeAction.jsp?evaluationID=">Like</a>
                              <a onclick="return confirm('Do you want to delete?')" href="./likeAction.jsp?evaluationID=">Delete</a>
                          </div>
          
                      </div>
          
                    </div>
                  </div>

    </div>



    <footer class="bg-dark mt-4 p-5 text-center" style="color:white;">
        Copyright &copy; 2019 kimdaehyeon practice.
    </footer>




    <!-- Modal -->
    <div class="modal fade" id="registerModalId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">등록하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">

                        <form action="./evaluationRegister.jsp" method="post">
                            <div class="row">
                                <div class="col form-group">
                                    <label for="">강의명</label>
                                    <input type="text" class="form-control" name="lectureName" id="" aria-describedby="helpId"
                                        placeholder="강의명을 입력해주세요." maxlength="20">
                                </div>
                                <div class="col form-group">
                                    <label for="">교수명</label>
                                    <input type="text" class="form-control" name="professorName" id="" aria-describedby="helpId"
                                        placeholder="교수명을 입력해주세요." maxlength="20">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <label for="">수강년도</label>
                                    <select class="custom-select" name="lectureYear" id="">
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option selected value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                    </select>
                                </div>


                                <div class="col-4 form-group">
                                    <label for="">수강학기</label>
                                    <select class="custom-select" name="SemesterDivide" id="">
                                        <option selected value="1학기">1학기</option>
                                        <option value="여름학기">여름학기</option>
                                        <option value="2학기">2학기</option>
                                        <option value="겨울학기">겨울학기</option>
                                    </select>
                                </div>

                                <div class="col-4 form-group">
                                    <label for="">강의구분</label>
                                    <select class="custom-select" name="lectureDivide" id="">
                                        <option selected value="전체">전체</option>
                                        <option value="전공">전공</option>
                                        <option value="교양">교양</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col form-group">
                                    <label for="">제목</label>
                                    <input type="text" class="form-control" name="evaluationTime" id=""
                                        aria-describedby="helpId" placeholder="" maxlength="30">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col form-group">
                                    <label for="">내용</label>
                                    <textarea class="form-control" name="evaluationContent" id="" aria-describedby="helpId"
                                        placeholder="" maxlength="2048" style="height: 180px;"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col form-group">
                                    <label for="">종합점수</label>
                                    <select class="custom-select" name="totalScore" id="">
                                        <option selected value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>

                                <div class="col form-group">
                                    <label for="">성적관련</label>
                                    <select class="custom-select" name="creditScore" id="">
                                        <option selected value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>

                                <div class="col form-group">
                                    <label for="">프리한 정도</label>
                                    <select class="custom-select" name="comfortableScore" id="">
                                        <option selected value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>

                                <div class="col form-group">
                                    <label for="">강의력</label>
                                    <select class="custom-select" name="lectureScore" id="">
                                        <option selected value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">등록</button>
                            </div>


                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="reportModalId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
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
                                <div class="col form-group">
                                  <label for="">신고 제목</label>
                                  <input type="text" class="form-control" name="reportTitle" id="" aria-describedby="helpId" placeholder="">
                                </div>
                            </div>

                            <div class="row">     
                                <div class="col form-group">
                                  <label for="">신고 내용</label>
                                  <textarea type="text" class="form-control" name="reportContent" id="" aria-describedby="helpId" placeholder="" style="height: 180px;">
                                    </textarea>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-danger">신고하기</button>
                            </div>

                        </form>


                    </div>
                </div>

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