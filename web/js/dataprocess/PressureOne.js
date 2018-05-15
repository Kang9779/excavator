function drawPressureOne(dataX,dataY1) {
    var myChart = echarts.init(document.getElementById("pressureOne"));
    option = {
        tooltip: {
            trigger: 'axis',
            fontSize: 9
        },
        color: ["#ec870e"],
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {

        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data:dataX,
            axisLabel:{
                interval:0,//显示全部数据
            }
        },
        yAxis: [{
            name:'压力值/Pa',
            type: 'value',
            axisLabel: {
                formatter: '{value}'
            }
        }],
        legend:{
          show:true,
          data:['压力值']
        },
        dataZoom: [{
            show:true,
            type: 'slider',
            start: 0,
            end: 100
        },{
            show: true,
            type: 'inside',
            start: 0,
            end: 50
        }],
        series : [
            {
                name : '压力数据',
                type : 'line',
                symbol:'emptyrect',
                smooth : true,
                data : dataY1
            }]
    };
    myChart.setOption(option,true);
}


