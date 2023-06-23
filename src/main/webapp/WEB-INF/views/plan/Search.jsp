<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link
  rel="stylesheet"
  href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"
/>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $(function () {
    $("#datepicker_start").datepicker({
      defaultDate: '-1y'  
    });
    $("#datepicker_start").datepicker("option", "dateFormat", "yy-mm-dd");
    $("#datepicker_end").datepicker();
    $("#datepicker_end").datepicker("option", "dateFormat", "yy-mm-dd");

    function getDate(element) {
      var date;
      try {
        date = $.datepicker.parseDate(dateFormat, element.value);
      } catch (error) {
        date = null;
      }

      return date;
    }
  });
</script>
<div class="container" style="margin-top: 50px">
  <div class="jumbotron bg-info">
    <h1>SearchTrend</h1>
  </div>
  <p>StartDate: <input type="text" id="datepicker_start" class="start" /></p>
  <p>EndDate: <input type="text" id="datepicker_end" class="end" /></p>
  <p>검색어1: <input type="text" id="search1" /></p>
  <p>검색어2: <input type="text" id="search2" /></p>
  <p>검색어3: <input type="text" id="search3" /></p>
  <p>검색어4: <input type="text" id="search4" /></p>
  <p>검색어5: <input type="text" id="search5" /></p>
  <button class="btn btn-primary" id="btn">결괴 얻기</button>
</div>
<!--container-->
<script>
  $("#btn").click(function () {
    $.ajax({
      url: '<c:url value="/plan/GetSearchTrend.do"/>',
      dataType: "json",
      method: "post",
      headers: {
        "Content-Type": "application/json",
        "X-NCP-APIGW-API-KEY-ID": "ohzsg7u4i3",
        "X-NCP-APIGW-API-KEY": "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX",
      },
      data: JSON.stringify({
        startDate: $(".start").val(),
        endDate: $(".end").val(),
        timeUnit: "month",
        keywordGroups: [
          {
            groupName: $('#search1').val(),
            keywords: [$('#search1').val()]
          },
          {
            groupName: $('#search2').val(),
            keywords: [$('#search2').val()]
          },
          {
            groupName: $('#search3').val(),
            keywords: [$('#search3').val()]
          },
          {
            groupName: $('#search4').val(),
            keywords: [$('#search4').val()]
          },
          {
            groupName: $('#search5').val(),
            keywords: [$('#search5').val()]
          },
        ],
        device: "pc",
        ages: ["3", "4","5"],
      }),
    })
      .done((data) => {
        console.log("서버로부터 받은 데이터:", data);
      })
      .fail((error) => {
        console.log(error);
      });
  });
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>
