<%--
  스터디 카페 예약 단
  User: 신지혜
  Date: 2021-11-18
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
		<title>예약하기</title>
		
		<style>


    /*---------- 모달 ----------*/

    .modal-dialog.modal-80size {
      width: 80%;
      height: 80%;
      margin: 0;
      padding: 0;
    }

    .modal-content.modal-80size {
      height: auto;
      min-height: 80%;
    }

    .modal.modal-center {
      text-align: center;
    }

    @media screen and (min-width: 768px) {
      .modal.modal-center:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }

    .modal-dialog.modal-center {
      display: inline-block;
      text-align: left;
      vertical-align: middle;
    }

    /*---------- 모달 end ----------*/


     #rsrvSubmit {
	     justify-content: space-around;
	     padding: 1.2rem 6rem;
	     font-size: 1.28rem;
	
     }

    .datatable-cell.datatable-cell-sort.datatable-cell-sorted span {
	     font-size: 5.0rem;
     }


		</style>
		<!--head.html Include-->
		<jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->

<body id="kt_body" class="header-fixed subheader-enabled page-loading">

<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
		<!----------------페이지 시작----------------------->
		<div class="d-flex flex-row flex-column-fluid page">
				<!--begin::Wrapper-->
				<div class="d-flex flex-column flex-row-fluid wrapper"
				     id="kt_wrapper">
						<!------------------header.html Include------------------>
						<jsp:include page="../../commons/header.jsp"/>
						<!------------------Header Wrapper : 메뉴 탭 시작------------------>
						<!--menu.html Include-->
						<jsp:include page="../../commons/menu_main.jsp"/>
						<!------------------Header Wrapper : 메뉴 탭 종료------------------>
						<!--컨테이너 시작-->
						<div class="d-flex flex-row flex-column-fluid container">
								<!--contents.html Include-->
								<!--begin::Content Wrapper 내용물 시작-->
								<div class="main d-flex flex-column flex-row-fluid">
										<!--Subheader : 서브헤더 페이지 제목란 시작-->
										<div class="subheader py-2 py-lg-6" id="kt_subheader">
												<!--begin::Subheader-->
												<div
														class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
														<!--begin::Details-->
														<div class="d-flex align-items-center flex-wrap mr-1">
																<!--begin::Title-->
																<h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">예약하기</h5>
																<!--end::Title-->
																<!--begin::Separator-->
																<div
																		class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
																<!--end::Separator-->
																<!--begin::Search Form-->
																<div class="d-flex align-items-center" id="kt_subheader_search">
																		<span class="text-dark-50 font-weight-bold" id="kt_subheader_total"></span>
																</div>
																<!--end::Search Form-->
														</div>
														<!--end::Details-->
														<!--begin::Toolbar-->
														<div class="d-flex align-items-center">
																<!--begin::Button-->
																<a onclick="history.back();" class="btn btn-default font-weight-bold">Back</a>
																<!--end::Button-->
																
														</div>
														<!--end::Toolbar-->
												</div>
												<!--end::Subheader-->
										</div>
										<!--Subheader : 서브헤더 페이지 제목란 종료-->
										
										<!------------------ 본문 시작 ------------------>
										<!--begin::Content-->
										<div class="content flex-column-fluid" id="kt_content">
												<form action="/payment/challenge/applyStatusChange" method="post" id="formObj">
										
														
														<!--begin::Card-->
														
											
																
																<!--begin::Body-->
																
<%--																<!--end::Body-->--%>
<%--																<div class="card-body">--%>
<%--																		<!--begin: Datatable-->--%>
<%--																		--%>
<%--																	--%>
<%--																		--%>
<%--																		--%>
<%--																		<!--end::Body-->--%>
<%--																	<div class="d-flex mb-10" style="justify-content: flex-end;">--%>
<%--																		<button type="button" class="btn btn-primary font-weight-bold font-size-h6 px-10 py-4 mr-40"--%>
<%--																		        data-toggle="modal" id="payBtn" onclick="checkFields();"--%>
<%--																		        data-target="#my80sizeCenterModal">--%>
<%--																			결제--%>
<%--																		</button>--%>
<%--																	</div>--%>
<%--																	--%>
<%--																	--%>
<%--																	<!--모달시작::-->--%>
<%--																		<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1"--%>
<%--																		     role="dialog" aria-labelledby="my80sizeCenterModalLabel">--%>
<%--																				<div class="modal-dialog modal-80size modal-center" role="document">--%>
<%--																						<div class="modal-content modal-80size">--%>
<%--																								<div class="modal-header " style="background-color:#ffa800;">--%>
<%--																										--%>
<%--																										<h4 class="modal-title" id="myModalLabel">챌린지 참여금 결제</h4>--%>
<%--																								--%>
<%--																								</div>--%>
<%--																								<div class="modal-body">--%>
<%--																									<div class="datatable datatable-bordered datatable-head-custom--%>
<%--																		datatable-default datatable-primary datatable-loaded" id="결제정보" style="">--%>
<%--																										<table class="datatable-table"--%>
<%--																										       style="display: block;margin-left: auto;margin-right: auto;width: 80%;">--%>
<%--																											<thead class="datatable-head">--%>
<%--																											<tr class="datatable-row" style="left: 0px;">--%>
<%--																												<th data-field="OrderID"--%>
<%--																												    class="datatable-cell datatable-cell-sorted">--%>
<%--																													<span style="width: 250px;font-size: 1.3rem;">결제정보</span></th>--%>
<%--																											</tr>--%>
<%--																											</thead>--%>
<%--																											<tbody style="" class="datatable-body">--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																												<td class="col-4 pr-8 datatable-cell-right datatable-cell--%>
<%--																													font-weight-bolder">스터디유형--%>
<%--																												</td>--%>
<%--																												<td class="text-dark-75 text-left pl-4 font-size-md mb-0">--%>
<%--																													Challenge--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																												<td class="col-4 pr-8 datatable-cell-right datatable-cell--%>
<%--																													font-weight-bolder">스터디명--%>
<%--																												</td>--%>
<%--																												<td class="text-dark-75 text-left pl-4 font-size-md mb-0">--%>
<%--																													스터디명(스터디id)--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																												<td class="col-4 pr-8 datatable-cell-right datatable-cell--%>
<%--																													font-weight-bolder">참여기간--%>
<%--																												</td>--%>
<%--																												<td class="text-dark-75 text-left pl-4 font-size-md mb-0">--%>
<%--																													시작일-총00일--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											--%>
<%--																											<div class="ml-4 datatable-cell-sorted ">--%>
<%--																												<div class="font-weight-bolder mb-0 h3">--%>
<%--																													10,000 원--%>
<%--																												</div>--%>
<%--																											--%>
<%--																											</div>--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																												<td class="col-4 pr-8 datatable-cell-right datatable-cell--%>
<%--																													font-weight-bolder">환급예정일--%>
<%--																												</td>--%>
<%--																												<td class="text-dark-75 text-left pl-4 font-size-md mb-0">--%>
<%--																													종료일자--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row">--%>
<%--																												<td class="col-4 pr-8 datatable-cell-right datatable-cell"><span--%>
<%--																													class="font-weight-bolder">결제금액</span></td>--%>
<%--																												<td class="font-weight-bolder mb-0 h3" style="color: #6b984f;">--%>
<%--																												--%>
<%--																													10,000 원--%>
<%--																												--%>
<%--																												</td>--%>
<%--																												--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											</tbody>--%>
<%--																										</table>--%>
<%--																									--%>
<%--																									</div>--%>
<%--																									<!--end: 결제정보 -->--%>
<%--																									--%>
<%--																									<!--end: 환불규정 -->--%>
<%--																									<div class="separator separator-dashed my-10"></div>--%>
<%--																									--%>
<%--																									<div class="datatable datatable-bordered datatable-head-custom--%>
<%--																																					datatable-default datatable-primary datatable-loaded"--%>
<%--																									     id="환불규정" style="">--%>
<%--																										<table class="datatable-table"--%>
<%--																										       style="display: block;margin-left: auto;margin-right: auto;width: 80%;">--%>
<%--																											--%>
<%--																											<thead class="datatable-head">--%>
<%--																												<tr class="datatable-row" style="left: 0px;">--%>
<%--																													<th class="datatable-cell datatable-cell-sorted"--%>
<%--																													    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">환급규정</span></th>--%>
<%--																											</tr>--%>
<%--																											</thead>--%>
<%--																											--%>
<%--																											<tbody style="" class="datatable-body">--%>
<%--																											--%>
<%--																												<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																													<td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell--%>
<%--																													font-weight-bolder">#1--%>
<%--																													</td>--%>
<%--																													<td class="text-dark-75 text-left pl-1 font-size-md mb-0">--%>
<%--																														챌린지 종료일 이전 환불은 불가합니다.--%>
<%--																													</td>--%>
<%--																												</tr>--%>
<%--																												--%>
<%--																												<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																													<td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell--%>
<%--																													font-weight-bolder">#2--%>
<%--																													</td>--%>
<%--																													<td class="text-dark-75 text-left pl-1 font-size-md mb-0">--%>
<%--																														챌린지 종료일 기준 출석률에 비례하여--%>
<%--																														<br>환급금이 정산됩니다.--%>
<%--																														<br>--%>
<%--																														<span class="text-danger font-size-sm">(100일 챌린지에 50일 출석시 5,000원 환급)</span>--%>
<%--																													</td>--%>
<%--																												</tr>--%>
<%--																												--%>
<%--																												<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																													<td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell--%>
<%--																													font-weight-bolder">#3--%>
<%--																													</td>--%>
<%--																													<td class="text-dark-75 text-left pl-1 font-size-md mb-0">--%>
<%--																														환급금의 수령은 종료일 이후--%>
<%--																														<br>해당 스터디 페이지에 접속하여 가능합니다.--%>
<%--																														<br>--%>
<%--																														<span class="text-danger font-size-sm">(자동환급되지 않습니다.)</span>--%>
<%--																													</td>--%>
<%--																												</tr>--%>
<%--																												--%>
<%--																												<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																													<td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell--%>
<%--																													font-weight-bolder">#4--%>
<%--																													</td>--%>
<%--																													<td class="text-dark-75 text-left pl-1 font-size-md mb-0">--%>
<%--																														참여금 미결제시 해당 챌린지 참여가 불가합니다.--%>
<%--																													</td>--%>
<%--																												</tr><!--//TODO 개;;-->--%>
<%--																											--%>
<%--																											</tbody>--%>
<%--																										</table>--%>
<%--																									</div>--%>
<%--																									--%>
<%--																									--%>
<%--																									<div class="separator separator-dashed my-10"></div>--%>
<%--																									--%>
<%--																									<div class="datatable datatable-bordered datatable-head-custom--%>
<%--																		datatable-default datatable-primary datatable-loaded" style="">--%>
<%--																										<table class="datatable-table"--%>
<%--																										       style="display: block;margin-left: auto;margin-right: auto;width: 80%;">--%>
<%--																											<thead class="datatable-head">--%>
<%--																											<tr class="datatable-row" style="left: 0px;">--%>
<%--																												<th data-field="PayID" style="border-bottom: 1px solid #ebedf3;"--%>
<%--																												    class="datatable-cell datatable-cell-sorted"--%>
<%--																												    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">결제방법</span></th>--%>
<%--																											</tr>--%>
<%--																											</thead>--%>
<%--																											<tbody style="" class="datatable-body">--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">--%>
<%--																												<td class="datatable-cell-left datatable-cell ml-15">--%>
<%--																													--%>
<%--																													<label class="radio font-weight-bolder" for="cash">--%>
<%--																														<input type="radio" id="cash" name="pay" value="" class="ck" title="결제방법">--%>
<%--																														<span class="mr-2"></span>실시간 출금</label>--%>
<%--																												--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											</tbody>--%>
<%--																										</table>--%>
<%--																									</div>--%>
<%--																									--%>

<%--																									<div class="separator separator-dashed my-10"></div>--%>
<%--																									--%>
<%--																									<div class="datatable datatable-head-custom--%>
<%--																		datatable-default datatable-primary datatable-loaded" style="">--%>
<%--																										<table class="datatable-table mb-10"--%>
<%--																										       style="display: block;margin-left: auto;margin-right: auto;width: 80%;">--%>
<%--																											<thead class="datatable-head">--%>
<%--																											--%>
<%--																											<tr class="datatable-row" style="left: 0px;">--%>
<%--																												<th class="datatable-cell datatable-cell-sorted"><span style="width: 250px;font-size: 1.3rem;">서비스 동의</span>--%>
<%--																												</th>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											</thead>--%>
<%--																											--%>
<%--																											--%>
<%--																											<tbody style="" class="datatable-body checkbox_group">--%>
<%--																											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">--%>
<%--																												<td class="datatable-cell-left datatable-cell ml-15"><span>--%>
<%--																					--%>
<%--																					<span	class="font-weight-bolder">	<label class="text-right checkbox" for="check_all">--%>
<%--																						<input type="checkbox" id="check_all" name="check_all" class="ck" title="서비스동의">--%>
<%--																						<span class="mr-2"></span>전체 동의</label></span></span></td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">--%>
<%--																												<td class="datatable-cell-left datatable-cell ml-15">--%>
<%--																					<span class="font-weight-bolder">	<label class="checkbox mr-2" for="check_1">--%>
<%--																										<input type="checkbox" id="check_1" class="normal">--%>
<%--																										<span class="mr-2"></span>위의 안내 사항 동의 및 결제 진행 동의 <h8--%>
<%--																						class="text-danger ml-1">(필수)</h8></label> </span>--%>
<%--																												--%>
<%--																												</td>--%>
<%--																											</tr>--%>
<%--																											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">--%>
<%--																												<td class="datatable-cell-left datatable-cell ml-15"--%>
<%--																												    aria-label="400"><span>--%>
<%--																					<span class="font-weight-bolder">	<label class="checkbox" for="check_2">--%>
<%--																										<input type="checkbox" id="check_2" class="normal">--%>
<%--																										<span class="mr-2"></span>개인정보 제3자 제공 동의<h8--%>
<%--																						class="text-danger ml-1">(필수)</h8></label></span></span></td>--%>
<%--																											</tr>--%>
<%--																											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">--%>
<%--																												<td class="datatable-cell-left datatable-cell ml-15"--%>
<%--																												    aria-label="400"><span>--%>
<%--																					<span class="font-weight-bolder"><label class="checkbox" for="check_3">--%>
<%--																										<input type="checkbox" id="check_3" class="normal">--%>
<%--																										<span class="mr-2"></span>개인정보 수집 및 이용 동의<h8--%>
<%--																						class="text-danger ml-1">(필수)</h8></label></span></span></td>--%>
<%--																											</tr>--%>
<%--																											--%>
<%--																											</tbody>--%>
<%--																										</table>--%>
<%--																									</div>--%>
<%--																								</div>--%>
<%--																	--%>
<%--																								<div class="modal-footer">--%>
<%--																										<button type="button" class="btn btn-primary  btn-lg "--%>
<%--																										        id="rsrvSubmit" style="" onclick="authorize();">결제하기</button>--%>
<%--																						--%>
<%--																								</div>--%>
<%--																						</div>--%>
<%--																				</div>--%>
<%--																		</div>--%>
<%--																--%>
<%--																--%>
<%--																</div>--%>
												</form>
														</div>
														<!--end::Card-->
												
										
										</div>
										
										<!--end::Content-->
								
								
								</div>
								<!--end::Content Wrapper 내용물 end-->
						</div>
						<!--컨테이너 종료-->
				</div>
				<!--end::Wrapper-->
		</div>
		<!----------------페이지 종료----------------------->
</div>
<!----------------메인 종료----------------------->

<!--컨테이너 종료-->
<!--footer.html Include-->
<jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

<script>

  
  const clientID = '8492614f-7af7-472e-9c00-f0b61b38ed33';
  const clientPWD = 'e9366e92-5b66-450e-8299-f1ebbf9473db';

  // 결제를 위해 인증창 팝업
	  function authorize() {
		


		  callAjax();
				
		  let location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
		                 "response_type=code&" +
		                 "client_id=" + clientID + "&" +
																	  "redirect_uri=http://localhost:8070/payment/rest/withdraw/challenge&" +
																	  "scope=login inquiry transfer&" +
																	  "client_info=test&" +
																	  "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&" +
																	  "auth_type=0&" +
																	  "cellphone_cert_yn=Y&" +
																	  "authorized_cert_yn=Y&" +
																	  "account_hold_auth_yn=N&" +
																	  "register_info=A";

	  var popup = window.open(location, '오픈뱅킹 본인인증', 'width=700px,height=800px,scrollbars=yes');
	  //
  }



  function callAjax(obj){
	  var submitObj = new Object();
	  let searchID = 9079; // 여기 화면단 ap-idx 뿌리기
	  submitObj.apply_idx = searchID;
	
	  console.log("submitObj.rsrv_idx: " + submitObj.rsrv_idx);
	
	  $.ajax({
		         type       : 'POST',
		         url        : '/payment/rest/challenge/applyStatusChange',
		         data       : JSON.stringify(submitObj), // 예약번호 들고 출발
		         dataType   : 'text', // 받을 데이터는 json
		         contentType: "application/json; charset=utf-8",
		         success    : successCallback,
		         error      : errorCallback
	         });
	
	  // 성공시 데이터 처리
	  function successCallback(data) {
		  console.log("data: " + data);
		
		  Swal.fire('결제요청처리완!', '', 'success')
		
		//  window.location.href = '/cafe/reservationList';
		
	  } // successCallback
	
	  // 실패
	  function errorCallback() {
		  Swal.fire({
			            icon : 'warning', // Alert 타입
			            title: '요청실패', // Alert 제목
			            text : '요청에 실패하였습니다. 다시 시도해주세요!', // Alert 내용
		            });
	  } // errorCallback
  }
</script>


<script>
	
	
	//   // input값을 체크해서 결제 모달 안뜨게~
	// function checkFields() {
	// 	$('#payBtn').attr('data-target', '#my80sizeCenterModal');
	//
 //  // 히든값 제외하고, 입력하는 사항 중에
	// 	var frm = $('input[type=text]');
	//
 //  // 밸류값이 없다면 (입력되지 않았다면 )
	// 	frm.each(function (idx, ele) {
	//
	// 		if ("" == $(ele).val()) {
	//
 //  // 모달창 실행 안되게 타겟 값을 임시로 바꿈
	// 			$('#payBtn').attr('data-target', 'ttt');
	//
 //  // 경고창
	// 			Swal.fire('예약자의 ' + $(ele).attr("title") + '을(를) 입력해주세요!', '', 'warning')
	//
 //  // 해당 입력 칸으로 포커스
	// 			$(ele).focus();
	//
 //  // if문 그만 타세요
	// 			return;
	// 		}
	// 	});
	//
	// 	// 체크박스 중에
	// 	var ckfrm = $('input[class="ck"]');
	// 	ckfrm.each(function (idx, ele) {
	//
	// 		if (!$(ele).is(":checked")) {
	// 			$('#payBtn').attr('data-target', 'ttt');
	//
	// 			Swal.fire($(ele).attr("title") + '을(를) 확인해주세요!', '', 'warning')
	//
	// 			return;
	// 		}
	//
	// 	});
	//
	// }
	
	
</script>

<script>
	
	
	// // 체크박스 전체 선택, 전체 해제
	// $(".checkbox_group").on("click", "#check_all", function () {
	//
	// 	// 전체선택이 체크가 되어있는지 확인 한 후,
	// 	var checked = $(this).is(":checked");
	//
	// 	if(checked){ // 체크가 되어 있으면 div.checkbox_group 의 input들에 모두 checked, true
	// 		$(this).parents(".checkbox_group").find('input').prop("checked", true);
	// 	} else { // 체크가 해제 되면 모두 checked, false
	// 		$(this).parents(".checkbox_group").find('input').prop("checked", false);
	// 	}
	// });
	//
	//
	// // 전체선택 후 하나만 해제했을 때, 전체선택도 해체
	// $(".checkbox_group").on("click", ".normal", function() {
	// 	console.log("TLqkf" +  $(this).is(":checked"))
	// 	//  checked 속성을 판단
	//
	// 	if ($(this).is(":checked")==false) { // 체크 해제가 되어 있다면 전체선택의 체크박스도 해제
	// 		$("#check_all").prop("checked", false);
	// 	}
	// });
	//
	// // 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
	// // 체크박스 개별 선택
	// $(".checkbox_group").on("click", ".normal", function() {
	// 	var is_checked = true;
	//
	// 	$(".normal").each(function(){
	// 		is_checked = is_checked && $(this).is(":checked");
	// 	});
	//
	// 	$("#check_all").prop("checked", is_checked);
	// });
	
</script>

</html>