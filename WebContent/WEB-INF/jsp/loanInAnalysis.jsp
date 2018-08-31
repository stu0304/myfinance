<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>航天科工财务管理分析系统</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		
	
	</head>

	<body>
			<%@include file="header.jsp" %>

		<div class="main-container" id="main-container">

			<div class="main-container-inner">
             <%@include file="leftPage.jsp" %>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">控制台</li>
						</ul><!-- .breadcrumb -->

					</div>

					<div class="page-content">

						<div class="row">
							<div class="col-xs-12">
										<div class="table-header">
											资金借款分析
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														公司名称：<input type="text" id="mycompanyNameID" class="input-large" placeholder="公司名称" />

													 <button type="button" class="btn btn-purple btn-sm" onclick="loadPage()">
																			<i class="icon-search icon-on-right bigger-110"></i>
																			查询
																		</button>
													</form>
												</div>
											</div>
										</div>
										<div class="table-responsive">
											<table id="sample-table-2" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label>
																<input type="checkbox" class="ace" />
																<span class="lbl"></span>
															</label>
														</th>
														<th class="center">序号</th>
														<th class="center">公司名称</th>
														<th class="center">资产合计(万元)</th>
													    <th class="center">资产负债表</th>
														<th class="center">操作(申请借款)</th>
													</tr>
												</thead>

												<tbody id="mytbody">
												</tbody>
											</table>
										</div>
									</div>
										<div id="Pagination" class="center sabrosus"></div>
						
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content --> 

			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		
        <div id="addLogWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">借款申请</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">借款总额</div>
                                <div class="col-md-9">
                                 <input id="tLoanNumID" name="tCheckCircle" type="text" class="form-control"/>                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">借款开始时间</label>
                                <div class="col-md-9">
                                      <div id="loanStartTimeID" class="input-group date form_date col-md-10"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="tBuyDate" id="loanStartTime" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">借款结束时间</label>
                                <div class="col-md-9">
                                <div id="loanEndTimeID" class="input-group date form_date col-md-10"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="tBuyDate" id="loanEndTime" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">借款利率</label>
                                <div class="col-md-3">
                                       <input id="lilvID" name="tCheckCircle" type="text" class="form-control"/> 
                                </div>
                            </div>
                        </div>
	                    
                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="loanOutComId"/>
                    <button type="button" id="myupdateSubID" onclick="subLoan();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 删除确认 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					删除消息
				</h4>
			</div>
			<div class="modal-body">
				确定要删除数据么？
			</div>
			<div class="modal-footer">
			 <input type="hidden" id="deleteLogID"/>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteLog()">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div id="comCapChart" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">公司资产负债表</span>
                </h4>
            </div>
                <div class="modal-body">
                       <div id="pieContainer" style="width:500px;height:500px"></div>
                </div>
              <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="myrefresh()">
					关闭
				</button>
			</div>
        </div>
    </div>
</div>
		
</body>
<%@include file="commonJS.jsp" %>		
<script>
var pageIndex = 0;        
var pageSize = 5;        

$(document).ready(function(){
	initPage();
});

function initPage()
{
	loadPage(pageIndex,pageSize);
	mypagination(${comCapitalCounNum},pageIndex,pageSize);
}

function myrefresh()
{
	window.location.href="${myappurl}goToLoanIn.do";
}

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
	    $('#pieContainer').highcharts({
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
	        series:zcfzJson
	    });
	    
	
	}

function getChartZcfzJSON(comid)
{
	  $.get("getChartPieZcfzJSON.do?tComId="+comid,function (data) {
		  initPieChart(eval(data));
		  $('#comCapChart').modal('show');   
	    });
	}



function deleteLog()
{
	
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}deleteOneLogJSON.do",
	        data : {
	        	tLogId: $('#deleteLogID').val()
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	         		$('#myModal').modal('hide');   
	        		   loadPage(pageIndex,pageSize);
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        	
	        	$('#addLogWin').modal('hide');   
	        }
	    }); 
}

function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("<%=basePath%>loadCompanyCapital.do",
	   	    	  {
	   	    		tComName: $("#mycompanyNameID").val(),
	   	    		tComId:"${myperson.tComId}",
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{    
	            	        sno = parseInt(temp)+1;
							htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tComName+'</td><td class="center">'+jsonArray[temp].tZichanheji+'</td>'
							if(jsonArray[temp].tZichanheji!='0'&&jsonArray[temp].tZichanheji!=null)
								{
									htmls+='<td class="center"><a class="blue" href="javascript:getChartZcfzJSON(\''+jsonArray[temp].tComId+'\');">详情</a></td>';
									htmls+='<td class="center"><div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'
									htmls+='<a class="blue" href="javascript:openAddWin(\''+jsonArray[temp].tComId+'\');">申请借款</a></div></td></tr>'; 
								}else{
									htmls+='<td class="center">无财务数据</td>';
									htmls+='<td class="center">不能借款</td></tr>'
									
								}
						
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

function openDeleteConfirmWin(logid)
{
	 		$('#deleteLogID').val(logid);
	   		$('#myModal').modal('show');   
}
	
function openAddWin(tComId)
{
	   $('#loanOutComId').val(tComId);
	   $('#addLogWin').modal('show');   
}




//提交更新
function updateLog()
{       
	  $.ajax({
	        type: "POST",
	        url:"${myappurl}addOrUpdateLogJSON.do",
	        data : {
	             tLogId: $('#elogID').val(),
	             tFixContent:$('#fixcontentId').val(),
	             tLogAddtime:$('#equipLogDateId').val(),
	             tEquipId:$('#deviceHiddenID').val()
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		   $('#addLogWin').modal('hide');   
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        }
	    }); 
}

function subLoan()
{       
	  $.ajax({
	        type: "POST",
	        url:"${myappurl}addOrUpdateLoanDetails.do",
	        data : {
	        	tLoanoutComid: $('#loanOutComId').val(),
	        	tLoanStartTime:$('#loanStartTime').val(),
	        	tLoanEndTime:$('#loanEndTime').val(),
	        	tLixi:$('#lilvID').val(),
	        	tLoanNum:$('#tLoanNumID').val()
	        	
			},
	        async: true,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		   $('#addLogWin').modal('hide');   
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        }
	    }); 
}


$('#loanStartTimeID').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

$('#loanEndTimeID').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

</script>
</html>

    