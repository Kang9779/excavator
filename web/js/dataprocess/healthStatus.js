function drawHealthCure(dataX,dataY1,dataY2,dataY3){
    var myChart = echarts.init(document.getElementById("healthCure"));
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
                interval:0//显示全部数据
            }
        },
        yAxis: [{
            name:'HV',
            type: 'value',
            axisLabel: {
                formatter: '{value}',
                interval:0
            }
        }],
        legend:{
            show:true,
            data:['动臂健康值','动杆健康值','铲斗健康值']
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
                name : '动臂健康值',
                type : 'line',
                color:'#dacd19',
                smooth : true,
                data : dataY1,
                markPoint : {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                symbol:'emptycircle'
            },
            {
                name : '动杆健康值',
                type : 'line',
                color:'#87cefa',
                smooth : true,
                data : dataY2,
                markPoint : {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                symbol:'emptyDiamond',
            },
            {
                name : '铲斗健康值',
                type : 'line',
                color:'#3b79ff',
                smooth : true,
                symbol:'emptyrect',
                data : dataY3,
                markPoint : {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                }
            }
        ]
    };
    myChart.setOption(option,true);
}

//健康状态雷达图
function drawHealthRadar(){
    var myChart = echarts.init(document.getElementById("healthRadar"));
    option = {
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            x : 'center',
            data:['性能评价指标']
        },
        calculable : true,
        polar : [
            {
                indicator : [
                    {text : '动臂', max  : 1},
                    {text : '动杆', max  : 1},
                    {text : '铲斗', max  : 1},
                    {text :'整体性能',max :1}
                ],
                radius : 150
            }
        ],
        series : [
            {
                name: '性能评价指标',
                type: 'radar',
                itemStyle: {
                    normal: {
                        areaStyle: {
                            type: 'default'
                        }
                    }
                },
                data : [
                    {
                        value : [0.9, 0.5, 0.8,0.78],
                        name : '性能评价指标'
                    }
                ]
            }
        ]
    };
    myChart.setOption(option,true);
}