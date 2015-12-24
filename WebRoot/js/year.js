
 $(document).ready(function(){
    //选择人
    $(".sel").click(function(){
        $(this).toggleClass("up");
        $(".namelist").slideToggle();
    });
    $(".namelist li").click(function(){
        $(".sel span").text($(this).text());
        $(".namelist").hide();
        $(".sel").removeClass("up");
    });

    $(".titnum span i").each(function(){
      var k = $(this).parents(".titnum").next(".scollbox").find("li").size();
      $(this).text( k );
    });
});

 (function($){
  $(window).load(function(){
    $(".scollbox").mCustomScrollbar({
      theme:"dark"
    });
  });
})(jQuery);


var myChart = '';
require.config({
    paths: {
        echarts: 'plugins/echarts'
    }
});

require(
    [
        'echarts',
        'echarts/chart/bar'
    ],

    function (ec) {
        //饼状图
        myChart = ec.init(document.getElementById('main'));     
        option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            // legend: {
            //     data:['利润', '支出', '收入']
            // },
            grid:{
              x:40,
              y:10,
              x2:30,
              y2:25,
              borderWidth:0
            },
            color:['#32cd32','#88d4ec','#ffc916'],
            calculable : true,
            xAxis : [
                {
                    type : 'value',
                    splitLine:false,
                    axisLine :{
                        lineStyle :{
                          color: '#d8d8d8',
                          width: 1,
                          type: 'solid'
                        }
                    },
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    splitLine:false,
                    axisLine :{
                        lineStyle :{
                          color: '#d8d8d8',
                          width: 2,
                          type: 'solid'
                        }
                    },
                    axisTick : {show: false},
                    data : ['一','二','三','四','五','六','七','八','九','十','十一','十二']
                }
            ],
            series : [
                {
                    name:'新入职',
                    type:'bar',
                    itemStyle : { normal: {label : {show: true, position: 'inside'}}},
                    data:[0, 0, 5, 0, 0, 0, 12, 0, 0, 4, 2, 0]
                },
                {
                    name:'总',
                    type:'bar',
                    stack: '总量',
                    barWidth : 5,
                    itemStyle: {normal: {
                        label : {show: true}
                    }},
                    data:[42, 41, 38, 41, 40, 39, 38, 44, 43, 42, 45, 46]
                },
                {
                    name:'离职',
                    type:'bar',
                    stack: '总量',
                    itemStyle: {normal: {
                        label : {show: true, position: 'left'}
                    }},
                    data:[-1, -3, -2, -1, -1, -1, -6, -1, -1, -1, -1, 0]
                }
            ]
        };
        myChart.setOption(option);   
   }
);
