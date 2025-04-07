$(document).ready(function() {
   $("#btnSearch").click(function() {
      $("#show").empty();
      $("#showCount").empty();

      let bname = $("#name").val();
      // alert(bname);

      $.ajax({
         type: "get",
         url: "js41jikwon.jsp",
         data: { "name": bname },
         dataType: "json",
         success: function(datas) {
            // alert(datas.jikwons.length);  // 데이터를 콘솔에서 확인하기 위한 alert
            let count = 0;
            let str = "<table border='1'>";
            str += "<tr><th>사번</th><th>직원명</th><th>직급</th><th>관리고객수</th></tr>";  // 테이블의 헤더 추가

            // 데이터가 jikwons 배열에 들어있다고 가정하고 출력
            $.each(datas.jikwons, function(idx, data) {
               str += "<tr>";
               str += "<td>" + data["jikwonno"] + "</td>";

               if (Number(data["jikwongogek"]) === 0) {
                  str += "<td>" + data["jikwonname"] + "</td>";

               } else {
                  str += "<td><a href='javascript:func(" + data["jikwonno"] + ")'>" + data["jikwonname"] + "</a></td>";
               }

               str += "<td>" + data["jikwonname"] + "</td>";
               str += "<td>" + data["jikwonjik"] + "</td>";
               str += "<td>" + data["jikwongogek"] + "</td>";
               str += "</tr>";
               count++;  // 고객수 카운트
            });

            str += "</table>";  // 테이블 닫기
            $("#show").append(str);  // 테이블을 #show에 출력
            $("#showCount").append("건수: " + count);  // 고객 수 출력
         },
         error: function() {
            $("#show").append("직원 읽기 에러");
         }
      });
   });
});


function func(para) {
   // alert(para);
   $("#gogek").empty();

   $.ajax({
      type: "post",
      url: "js41gogek.jsp",
      data: { "arg": para },
      dataType: "json",
      success: function(datas) {
         // alert(datas);
         let str = "<table border='1'>";
         str += "<tr><th>고객명</th><th>전화</th></tr>";  // 테이블의 헤더 추가

         // 데이터가 jikwons 배열에 들어있다고 가정하고 출력
         $.each(datas.gogeks, function(idx, data) {
            str += "<tr>";
            str += "<td>" + data["gogekname"] + "</td>";
            str += "<td>" + data["gogektel"] + "</td>";
            });
            str += "<table>";
            $("#gogek").append(str);
         },
            error: function() {
               $("#gogek").text("고객 읽기")
            }
   })
}