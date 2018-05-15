/**
 *
 * china.js格式
 */
var myChart  = echarts.init(document.getElementById("location"))
var mydata=[

    {
      name:'厄尔多斯',value:[109.781327, 39.608266, 120]
    },
    {
        name: '舟山', value: [122.207216, 29.985295, 123]
    }
]

var option= {
    geo: {
        map: 'china',
        itemStyle: {
            normal: {
                areaColor: '#797a6b',
                borderColor: '#111111'
            },
            emphasis: {
                areaColor: '#88ecff'
            }
        }
    },
    backgroundColor: '#ffffff',
    series: [
        {
            name: 'location',
            type: 'scatter',
            coordinateSystem: 'geo',
            data: mydata
        }
    ],
    visualMap: {
        type: 'continuous',
        min: 0,
        max: 200,
        inRange: {
            color: ['#14ba0e', '#ea2d23', '#d94e5d']
        },
        textStyle: {
            color: '#94ff47'
        }
    },

    title: {
        textStyle: {
            color: '#333',
            fontStyle: 'normal',
            fontWeight: 'bold',
            align: 'center'
        }
    }
}

myChart.setOption(option);

/**
 * china.json格式
 * */
// $.get('/china.json',function (chinajson) {
//     echarts.registerMap('china',chinajson);
//     var mychart = echarts.init(document.getElementById("location"));
//     var option={
//         geo:{
//             map:'china'
//         }
//     }
//     mychart.setOption(option);
//
// })