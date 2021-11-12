/* 페이징 처리하는 함수
  *  작성자: 신지혜
  */
function pager(listName) {
  console.log(listName)
  let totalData; //총 데이터 수
  let dataPerPage = 8; //한 페이지에 나타낼 글 수
  let pageCount = 5; //페이징에 나타낼 페이지 수
  let globalCurrentPage; //현재 페이지
  let currentPage = 1;
  // dataPerPage = $(".selectpicker").val();

  console.log(dataPerPage);

  //총 road된 게시글 수
  totalData = $(listName).children().length;
  console.log(totalData);
  if (totalData === 0) {
    alert("해당 조건에 조회되는 데이터가 존재하지 않습니다.");
    $('.datatable-pager').hide(); // 숨김처리
  } // if

  displayData(1, 8); //1번째페이지, 한페이지에 나타낼 글 수=체크박스 val(기본-5)
  paging(totalData, dataPerPage, pageCount, 1);

  function paging(totalData, dataPerPage, pageCount, currentPage) {//총데이타, 체크박스 val, 페이징수(10), 현재페이지(1)
    currentPage = Number(currentPage);
    console.log("currentPage : " + currentPage);

    let curPageId = currentPage > 1 ? Math.round((currentPage / dataPerPage)) + 1 : currentPage; // 현재 페이지 A tag ID

    // 총 페이지 수
    totalPage = Math.floor((totalData / dataPerPage) + ((totalData % dataPerPage) > 0 ? 1 : 0)); //총 페이지 수


    if (totalPage < pageCount) {
      pageCount = totalPage;
    } // if
    console.log("totalPage : " + totalPage);
    let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
    // let pageGroup = Math.ceil(curPageId/pageCount); // 페이지 그룹
    console.log("pageGroup : " + pageGroup);
    let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
    console.log("last : " + last);
    if (last > totalPage) {
      last = totalPage;
    } // if

    var first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
    if (first < 1) first = 1; // 첫페이지가 1보다 작을 경우 1로 세팅

    console.log("first : " + first);
    let next = last + 1;
    console.log("next : " + next);
    let prev = first - 1;
    console.log("prev : " + prev);
    let pageHtml = "";

    pageHtml += `
     <ul class="datatable-pager-nav my-2 mb-sm-0">
    `;
    // 이전, 처음으로 가기
    if (prev > 0) { // 이전, 처음으로 갈 수 있다면 이전, 처음버튼 활성화
      currentPage = Number(currentPage);
      console.log("prev > 0 : ");
      pageHtml +=
          `<li><a title="First"
                    class="datatable-pager-link datatable-pager-link-first"
                    data-page="1">
                      <i class="flaticon2-fast-back"></i></a></li>
             <li><a title="Previous"
                    class="datatable-pager-link datatable-pager-link-prev"
                    data-page="` + (currentPage - 1) + `">
                      <i class="flaticon2-back"></i></a></li>`;
    } else { // 현재 페이지가 첫번째 페이지라면 이전, 처음버튼 비활성화
      pageHtml +=
          `<li><a title="First"
                    class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled"
                    data-page="1"
                    disabled="disabled">
                       <i class="flaticon2-fast-back"></i></a></li>
              <li><a title="Previous"
                      class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled"
                      data-page="1"
                      disabled="disabled">
                        <i class="flaticon2-back"></i></a></li>`;
    } // if-else

    //페이징 번호 표시
    for (var i = first; i <= last; i++) {

      if (currentPage == i) { // 내가 클릭한 페이지(현재페이지) 번호 버튼은 활성화!
        pageHtml += `
            <li><a class="datatable-pager-link datatable-pager-link-number
                          datatable-pager-link-active"
                   data-page="`+ i +`"
                   title="`+ i +`">`+ i +`</a></li>`
      } else { // 아닌 페이지 번호는 하얗게
        pageHtml +=
            `<li><a class="datatable-pager-link datatable-pager-link-number"
                      data-page="`+ i +`"
                      title="`+ i +`">`+ i +`</a></li>`;
      } // if-else
    } // for

    // 이후, 맨 뒤로 가기
    if (next < totalPage) { // 이후로 갈 수 있다면(=내 페이지가 맨 끝이 아니라면) 이후 버튼 활성화
      pageHtml +=
          `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next"
                    data-page="`+ (currentPage + 1) +`">
                      <i class="flaticon2-next"></i></a></li>`;
    } else { // 내 페이지가 맨 끝이라면 이후 버튼 비활성화
      pageHtml +=
          `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next datatable-pager-link-disabled"
                    data-page="`+ (currentPage + 1) +`"
                    disabled="disabled">
                      <i class="flaticon2-next"></i></a></li>`
    } // if-else
    if (last < totalPage) { // 내 페이지가 맨 끝이 아니라면 마지막으로 가기 버튼 활성화
      pageHtml +=
          `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last"
                    data-page="`+ totalPage +`">
                      <i class="flaticon2-fast-next"></i></a></li> </ul>`;
    } else { // 내 페이지가 마지막이라면 마지막으로 가기 버튼 비활성화
      pageHtml +=
          `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last
                           datatable-pager-link-disabled"
                    data-page="`+ totalPage +`"
                    disabled="disabled">
                    <i class="flaticon2-fast-next"></i></a></li> </ul>`
    } // if-else
    pageHtml += `<div className="datatable-pager-info my-2 mb-sm-0" id="pagerInfo"></div>`

    // 드롭다운 html 생성문
    let pageSizePickerHtml ='';

    pageSizePickerHtml +=
        `
    <div class="dropdown bootstrap-select datatable-pager-size" style="width: 60px;">
<select
        class="selectpicker datatable-pager-size" title="Select page size" data-width="60px"
        data-container="body" data-selected="5" id="pageSizePicker">
      <option class="bs-title-option" value=""></option>
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="20">20</option>
      <option value="30">30</option>
      <option value="50">50</option>
      <option value="100">100</option>
    </select>

      <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light"
              data-toggle="dropdown" role="combobox" aria-owns="bs-select-9" aria-haspopup="listbox"
              aria-expanded="false" title="Select page size">
        <div class="filter-option">
          <div class="filter-option-inner">
            <div class="filter-option-inner-inner">5</div>
          </div>
        </div>
      </button>
      <div class="dropdown-menu ">
        <div class="inner show" role="listbox" id="bs-select-11"
     tabindex="-1" aria-activedescendant="bs-select-11-1">
  <ul class="dropdown-menu inner show" role="presentation">
    <li><a role="option" class="dropdown-item" id="bs-select-11-0" tabindex="0" aria-setsize="6"
           aria-posinset="1">
      <span class="text">5</span></a></li>
    <li > <!--  class="selected active" --> 
        <a role="option" class="dropdown-item"
           id="bs-select-11-1" tabindex="0" aria-setsize="6"
           >  <!-- class active selected aria-posinset="2" aria-selected="true" 추가  -->
        <span class="text">10</span></a>
    </li>
    <li><a role="option" class="dropdown-item" id="bs-select-11-2" tabindex="0">
        <span class="text">20</span></a>
    </li>
    <li><a role="option" class="dropdown-item" id="bs-select-11-3" tabindex="0">
        <span class="text">30</span></a>
    </li>
    <li><a role="option" class="dropdown-item" id="bs-select-11-4" tabindex="0">
        <span class="text">50</span></a>
    </li>
    <li><a role="option" class="dropdown-item" id="bs-select-11-5" tabindex="0">
        <span class="text">100</span></a>
    </li>
  </ul>
</div>
      </div>
   
    </div>`

    // 페이징 번호 그리기
    $(".datatable-pager.datatable-paging-loaded").html(pageHtml);

    // 드롭다운 그리기
    // $("#pagerInfo").html(pageSizePickerHtml);

    //페이징 번호 클릭 이벤트
    $(".datatable-pager.datatable-paging-loaded ul li a").click(function () {
      //전역변수에 선택한 페이지 번호를 담아서
      globalCurrentPage = $(this).attr("data-page");

      //페이징 표시 재호출
      paging(totalData, dataPerPage, pageCount, globalCurrentPage);

      //글 목록 표시 재호출
      displayData(globalCurrentPage, dataPerPage);
    }); // click-fn
  } // pager()




  // 페이지 사이즈 드롭다운 선택하면 화면단에서 적용하여 출력하는 함수
  // $('#pageSizePicker').change(function () {
  //   console.log("pageSizePickerValue 클ㄹ기했어여 ");
  //   console.log($("#pageSizePicker option:selected").val());
  //   let pageSizePickerValue = $("#pageSizePicker option:selected").val();
  //   console.log("pageSizePickerValue: " + pageSizePickerValue);
  //
  //   //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
  //   paging(totalData, pageSizePickerValue, pageCount, currentPage);
  //   displayData(currentPage, pageSizePickerValue);
  // }); // change-fn
}



//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
//기본 셋팅에서-> 숫자로 값 변동이 일어난다면 내용 숨기고 몇번째~몇번째 display만 변경하는 형식,
  let chartHtml = "";
  $('.datatable-body .datatable-row').attr('style', ('display:none'));

  //Number로 변환하지 않으면 아래에서 +를 할 경우 연산 아닌 결합됨!
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);

  for (
      var i = ((currentPage) - 1) * dataPerPage + 1;
      i <= (currentPage - 1) * dataPerPage + dataPerPage;
      i++
  ) {
    $('tr[data-row="' + i + '"]').attr('style', ('display:""'));
  } // for

} // displayData()