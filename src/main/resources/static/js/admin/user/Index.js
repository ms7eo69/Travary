
    Highcharts.chart('gender', {
      chart: {
        width: 400,
        height: 300,
        type: 'pie'  // 그래프 유형: 파이 그래프
      },
      title: {
        text: '이용자 성비'  // 그래프 제목
      },
      series: [{
        name: '회원 수',  // 시리즈 이름
        data: [
          ['남', 30],// ajax data 받아서 값 넣기
          ['여', 20]
        ]  // 그래프 데이터
      }]
    });

    var regidata = [
          {name:'5월', value:10},// ajax data 받아서 값 넣기
          {name:'6월', value:30},
          {name:'7월', value:20}
        ];
    Highcharts.chart('regimon', {
      chart: {
        // width: 600 ,
        height: 300,
        type: 'line',
      },
      title: {
        text: '월별 가입자 수'  // 그래프 제목
      },
      xAxis: {
        categories: regidata.map(function(d) { return d.name; })
      },
      yAxis: {
        title: ''
      },
      plotOptions: {
        line: {
          dashStyle: 'Dash', // 점선 스타일 설정
        }
      },
      series: [{
        name: '이달 가입자 수',
        data: regidata.map(function(d) {return d.value}) // 점선 그래프의 데이터
      }]
    });

    // highcharts
    var agedata = [
          {name:'10대', value:48},// ajax data 받아서 값 넣기
          {name:'20대', value:69},
          {name:'30대', value:36},
          {name:'40대', value:14},
          {name:'50대', value:7}
        ];
    var ageoptions = {
      chart: {
        // width: 400,
        height: 300,
        type: 'column'  // 그래프 유형: 파이 그래프
      },
      plotOptions: {
        column: {
          colorByPoint: true, // 각 막대를 개별적으로 색상 지정
        }
      },
      title: {
        text: '회원 연령대'  // 그래프 제목
      },
      xAxis: {
        categories: agedata.map(function(d) { return d.name; })
      },
      yAxis: {
        title: ''
      },
      series: [{
        name: '회원수',  // 시리즈 이름
        data: agedata.map(function(d){ return d.value; }) // 그래프 데이터
      }]
    };
    Highcharts.chart('age', ageoptions);



    function delete_(){
      $(this).parent().remove();
    }
    $('.delete_sns').click(delete_);
    $('.noport').click(delete_);

    $('.fa-x').hover(function(){
      $('.fa-x').addClass('fa-lg');
    },function(){
      $(this).removeClass('fa-lg');
    })