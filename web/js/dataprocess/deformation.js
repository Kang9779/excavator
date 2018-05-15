function drawDeformation(dataX,dataY3) {
    var myChart = echarts.init(document.getElementById("deformation"));
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
                interval:0,
            }
        },
        yAxis: [{
            name:'位移/mm',
            type: 'value',
            axisLabel: {
                formatter: '{value}'
            }
        }],
        legend:{
            show:true,
            data:['位移']
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
                name : '位移数据',
                type : 'line',
                symbol:'emptyrect',
                smooth : true,
                data : dataY3
            }]
    }
    myChart.setOption(option,true);
}


