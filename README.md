# 삼삼오오(SSFF)

### 프로젝트 주제

> 각종 분야별/지역별 STUDY 모집 웹사이트📝

## 0.

* 기술 스택<br>
  Web Server: Apache Tomcat 9.0<br>
  Database: Oracle cloud 19c <br>
  Backend: Java, Spring Framework<br>
  Frontend: Bootstrap, Javascript<br>
* 프로젝트 기간 : 2021. 10 ~
* 프로젝트 참여 인원 : 5인

## 1. 주요 기능

>

- 회원 가입 & 로그인 기능
- 스터디 리스트 기능
- 스터디 개설 기능
- 스터디 지원 기능
- 스터디 검색 및 분류 기능
- 스터디 카페 결제 및 예약 기능
- 스터디 내부 채팅 기능

## 2. 요구되는 페이지

>

- **메인 페이지**
  <br>
  1. 프로젝트 리스트 
  2. 챌린지 리스트
  3. 스터디 카페 리스트
  <br>
- **회원가입 페이지 & 로그인 페이지**
- **마이페이지**<br>
  1. 내가 개설한 / 참여중인 스터디를 보여준다.
  2. 스터디 일정 캘린더
- **프로젝트 리스트**<br>
  개설되거나 이미 마감된 프로젝트 리스트를 카드형으로 보여준다. 최신순, 인기순 , 마감여부 및 언어태그 별로 분류가 가능하다.
- **챌린지 리스트**<br>
  개설되거나 이미 마감된 챌린지 리스트를 카드형으로 보여주다. 지역, 유형, 내용으로 검색할 수 있다.
- **프로젝트 및 챌린지 상세페이지**<br>
  1. 스터디( 프로젝트 및 챌린지 ) 에 대한 상세 내용을 확인할 수 있다. <br>내가 지원한 스터디인 경우 `지원하기` 버튼이 `지원완료` 로 표시되며, 내가 지원하지 않은 스터디인 경우 `지원하기`버튼이 활성화된다. 
  2. 비동기 댓글 작성 및 수정이 가능하다.<br>  
- **관리자 페이지**<br>
  관리자는 회원 및 스터디 목록을 볼 수 있다.
- **스터디 메인 페이지**<br>
 일정 관리, 게시판 미리보기가 가능합니다. 
- **스터디 내부 게시판**<br>
 해당 스터디 인증, QnA등의 카테고리에 맞춰 게시글 작성 및 첨부파일 업로드가 가능합니다.
- **스터디 내부 채팅방**<br>
 해당 스터디 내의 스터디원들과 실시간 채팅이 가능합니다 
 <br>`(DB는 성능상의 문제로 구현하지 않았습니다)`

<a href="https://ibb.co/M8qp6kY"><img src="https://i.ibb.co/7g7V4tw/3-er.png" alt="3-er" border="0"></a>

## 3. 필요한 데이터베이스 정보

>

<a href="https://ibb.co/TvYPqD6"><img src="https://i.ibb.co/bWQNRjT/Kakao-Talk-20211205-033450699.png" alt="Kakao-Talk-20211205-033450699" border="0"></a>
<br>
<br>

## 4. 구현 결과

>
![image](https://user-images.githubusercontent.com/60432062/125256323-4da07580-e337-11eb-8104-4b14bd5c0a8d.png)
![image](https://user-images.githubusercontent.com/60432062/125256505-76c10600-e337-11eb-9b11-f271a1a42c9c.png)
<br>

- 메인페이지이자 게시판 기능을 가진 화면이다. 스터디를 만들고 싶은 사람들이 글을 올리면 목록에 보여진다. 게시글의 목록은 스터디 카테고리 분류에 따라 나눠서 조회할 수 있도록 하였다.
- 로그인이 되지 않은 상태에서 글쓰기나 스터디 모집글에 접근할 경우 로그인 페이지로 넘어가도록 하였다. Spring Security를 사용하여 접근 권한을 제한하였다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256629-95bf9800-e337-11eb-824a-7ae2ecd921e3.png)
<br>

- 로그인 후에는 글쓰기/게시글 조회/마이페이지/로그아웃 기능이 활성화된다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256698-a6700e00-e337-11eb-9d09-e08cf99e8570.png)
<br>
게시글을 눌러 글을 조회해 보았다.

- 본인이 등록한 글에서는 댓글창이 활성화 되지 않는다. 오직 다른 회원에 의해서만 신청 댓글을 받을 수 있기 때문이다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256804-c3a4dc80-e337-11eb-8d45-6a36e0b38e1e.png)
<br>
다른 회원으로 로그인 하여 참여 신청 댓글을 달았다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256844-cc95ae00-e337-11eb-8a0f-3224837097e5.png)
<br>

- 게시자 계정에서 내가 쓴 글을 조회하면 신청 댓글 수락 버튼이 활성화된다. 오직 게시자 계정만이 신청 댓글의 수락하기 버튼이 보인다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256911-dae3ca00-e337-11eb-93af-bd7ad4774605.png)
<br>

- 수락하기 버튼을 누르면 취소하기가 가능한데, 이는 스터디 그룹 최종 생성 전 스터디원의 구성을 바꿀 수 있음을 의미한다.
- 취소하기 후에 다시 수락하기도 가능하다.<br>

![image](https://user-images.githubusercontent.com/60432062/125256995-efc05d80-e337-11eb-8f6c-3d17d2b07dc2.png)
<br>

- 마이페이지에서 스터디 팀 개설을 완료시킬 수 있다.
- 내가 개설한 스터디 리스트와 참여 신청 댓글을 달았던 스터디 리스트를 보여준다.
- 내가 개설한 스터디 목록에서 관리 버튼을 누르게되면 참여를 수락했던 팀원들 목록을 보여준다.
- 내가 개설한 스터디 목록에서 팀 개설을 완료시켰다면 관리버튼이 리뷰버튼으로 바뀌게 된다.
- 스터디 개설자가 팀 개설을 완료시키지 않았다면 참여 신청한 스터디 리스트의 버튼이 생성 대기중으로 뜨고, 개설을 완료시켰다면 리뷰 버튼으로 바뀌게 된다.<br>

![image](https://user-images.githubusercontent.com/60432062/125257060-023a9700-e338-11eb-8a69-647761c7eaea.png)
<br>
팀 개설 완료 후 마이페이지로 돌아오면 리뷰버튼으로 전환된다.<br>

![image](https://user-images.githubusercontent.com/60432062/125257158-1aaab180-e338-11eb-8d8e-582b96ddefc7.png)
<br>

- 리뷰페이지에는 처음 모집게시글을 올릴 때 설정했던 스터디 기간의 주 수만큼 리뷰칸이 생성된다.
- 한 주가 끝날때마다 팀원별로 리뷰를 등록하여 피드백을 받을 수 있다.<br>

![image](https://user-images.githubusercontent.com/60432062/125257225-2b5b2780-e338-11eb-8c2a-85be6942e7db.png)
<br>

- 리뷰를 위한 팀원 리스트는 스터디에 참여한 팀원 중 본인을 제외하여 넣었다.
- 별점은 1점부터 5점까지 줄 수 있으며 한 회원에 대한 별점은 모든 스터디에 대한 누적 평균 점수이다.
- 나의 활동 별점은 마이페이지에서 확인이 가능하다.<br>

![image](https://user-images.githubusercontent.com/60432062/125257294-3ca43400-e338-11eb-94b8-c354a64b9179.png)
![image](https://user-images.githubusercontent.com/60432062/125257307-42017e80-e338-11eb-86f9-ea6ce68a0e4b.png)