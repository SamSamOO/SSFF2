# 삼삼오오(SSFF)

### 프로젝트 주제

> 각종 분야별/지역별 STUDY 모집 웹사이트📝

## 0.

* 기술 스택<br>
  Web Server: Apache Tomcat 9.0<br>
  Database: Oracle cloud 19c <br>
  Backend: Java, Spring Framework<br>
  Frontend: Bootstrap, Javascript<br>
* 프로젝트 기간 : 2021. 10 ~ 진행중
* 프로젝트 참여 인원 : 5인
<hr>

## 1. 주요 기능

>

- 회원 가입 & 로그인 기능
- 스터디 리스트 기능
- 스터디 개설 기능
- 스터디 지원 기능
- 스터디 검색 및 분류 기능
- 스터디 카페 결제 및 예약 기능
- 스터디 내부 채팅 기능
<hr>

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
<hr>

## 3. 필요한 데이터베이스 정보

>

<a href="https://ibb.co/TvYPqD6"><img src="https://i.ibb.co/bWQNRjT/Kakao-Talk-20211205-033450699.png" alt="Kakao-Talk-20211205-033450699" border="0"></a>
<br>
<br>
<hr>

## 4. 구현 결과 

- 시연 영상 : <a href="https://youtu.be/wdWq0gOh-Nk">시연영상</a>
 ```1080p 화질을 권장합니다.```
<br>

<img src='https://user-images.githubusercontent.com/80584060/144974123-9fddc685-5f14-433e-96db-112839d8d0a6.gif' alt='' border='0'/>

>**회원가입 (이메일 중복검증 - 닉네임 중복 검증 - 이메일 인증번호 발송)**

<hr>

<img src='https://user-images.githubusercontent.com/80584060/144974129-df2d788c-9ecc-4ead-91f1-12a61f619412.gif' alt='영상' border='0'/>

>**로그인 및 챌린지 리스트 페이지**
> <br>1. 챌린지 리스트 (카드형) <br>2. 언어 태그 , 최신순 인기순 정렬<br>3. 게시물 작성<br>4. 내가 작성한 글인 경우 수정/삭제 표시 및 타인 게시물인 경우 지원하기 버튼이 표시 >> 내가 이미 지원한 경우 ```지원완료```버튼이 SHOW

<hr>

<img src='https://user-images.githubusercontent.com/80584060/144974149-6446e2e7-ec21-4412-8d47-a97227cf4e63.gif' border='0' alt=""/>

>**프로젝트 리스트 페이지**
> <br>1. 프로젝트 리스트 (카드형) <br>2. 검색기능<br>3. 글 작성 및 수정 삭제<br>4. 댓글 비동기 작성, 수정, 삭제

<hr>

<img src='https://user-images.githubusercontent.com/80584060/144974106-6157db77-50dd-4264-8952-17c8b30f2a52.gif' alt='' border='0'/>

>**스터디 내부 게시판 페이지**
> <br>1. 목록형 게시글 리스트<br>2. 게시물 작성, 삭제<br>3. 파일 업로드

<hr>

<img src='https://user-images.githubusercontent.com/80584060/144974121-4de7cb1c-d92e-4b18-9815-01435f5b866d.gif' alt='' border='0'/><img src='https://user-images.githubusercontent.com/80584060/144974125-c7a76d86-f051-41f0-b47c-bf1b2ed22d25.gif' alt='' border='0'/>

>**챌린지 메인 페이지**
> <br>1. 챌린지 처음 접근시 결제창 표시 <br>2. 캘린더에 일정 추가, 수정, 삭제 <br>3. 출석하기( 하루에 한번 )<br>4. 게시판 미니 리스트<br>5. 출석랭킹 (미구현)

<hr>

<img src='https://user-images.githubusercontent.com/80584060/144974135-3aa11ef3-ebe2-4386-bcf2-d3c0455b4dd7.gif' alt='' border='0'/>

>**마이 페이지**
> <br>1. 예약리스트 출력 <br>2. 마이페이지 정보 출력 <br>3. 내가 가입한 스터디 일정 모두 표시 <br>4. 내가 가입한 스터디 목록 표시 <br>5. 내가 예약한 카페리스트 표시

