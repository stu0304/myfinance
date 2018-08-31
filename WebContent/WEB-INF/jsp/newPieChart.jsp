<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
<script src="${myappurl}resource/heighcharts/js/highcharts.js"></script>
<script src="${myappurl}resource/heighcharts/js/highcharts-3d.js"></script>
<script src="${myappurl}resource/heighcharts/js/modules/exporting.js"></script>
</head>
<body>
 <div id="container" style="min-width:500px;height:500px"></div>
 <script type="text/javascript">
 
 
 function initPieChart(zcfzJson)
 {

	    // Radialize the colors
	    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
	        return {
	            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
	            stops: [
	                [0, color],
	                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
	            ]
	        };
	    });
	    // 构建图表
	    $('#container').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '资产负债表占比图'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    },
	                    connectorColor: 'silver'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '公司资产负债表占比',
	            data: zcfzJson
	            ]
	        }]
	    });
 	}
 
 function getChartZcfzJSON(comid)
 {
 	  $.get("getChartPieZcfzJSON.do?tComId="+comid,function (data) {
 		  initPieChart(eval(data));
 	    });
 	}
 
 

 
 </script>
</body>
</html>