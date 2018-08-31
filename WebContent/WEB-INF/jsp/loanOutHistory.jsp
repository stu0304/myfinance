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
											放款历史记录
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														借款公司名称：<input type="text" id="jiekuancomID" class="input-large" />
														开始日期：<div id="myloanStartTime" class="input-group date form_date"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input id="loanStartTimeId" name="tBuyDate" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   
                	结束日期：<div id="myloanEndTime" class="input-group date form_date"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input id="loanEndTimeId" name="tBuyDate" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   

													 <button type="button" class="btn btn-purple btn-sm" onclick="mysearch()">
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
														<th class="center">借款公司名称</th>
															<th class="center">预警天数</th>
														<th class="center">距离还款日(天)</th>
														<th class="center">还款总额</th>
														<th class="center">借款金额</th>
														  <th class="center">借款利率</th>
														    <th class="center">违约金</th>
													    <th class="center">借款时间</th>
													     <th class="center">还款时间</th>
													    <th class="center">状态</th>
													
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

		
        



		
</body>
<%@include file="commonJS.jsp" %>		
<script>
var pageIndex = 0;        
var pageSize = 10;        

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	mypagination(${loanOutHisCountNum},pageIndex,pageSize);
	
});

function compareDate(startDate,endDate)
{
	if(startDate>=endDate)
		{
		  alert('开始日期大于或等于结束日期');
		  return false;
		}else{
			return true;
		}
	}

function mysearch(){
	 var  tLoanStartTime=$("#loanStartTimeId").val();
 	 var	tLoanEndTime=$("#loanEndTimeId").val();
 	 if(tLoanStartTime!=null&&tLoanStartTime!='')
 		 {
		 		if(compareDate(tLoanStartTime,tLoanEndTime))
				{
				   loadPage();
				}
 		 }else{
 			  loadPage();
 		 }
	
}


function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("<%=basePath%>selectLoanOutHistory.do",
	   	    	  {
	   	    	   tLoaninComid: $("#jiekuancomID").val(),
	   	    	   tLoanStartTime: $("#loanStartTimeId").val(), 
	   	    		tLoanEndTime: $("#loanEndTimeId").val(), 
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{    
	            	   sno = parseInt(temp)+1;
						htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tLoaninComid+'</td><td class="center">'+jsonArray[temp].tWarnDays+'</td>'
						if(jsonArray[temp].isWarn=='-1'){
							htmls+='<td class="center" style="color:red">'+jsonArray[temp].tLoanPreTime+'</td>'
						}else{
							htmls+='<td class="center" style="color:green">'+jsonArray[temp].tLoanPreTime+'</td>'
						}
						
						htmls+='<td class="center">'+jsonArray[temp].tChanghuanTotal+'</td>'
						htmls+='<td class="center">'+jsonArray[temp].tLoanNum+'</td><td class="center">'+jsonArray[temp].tLixi+'</td><td class="center">'+jsonArray[temp].tWeiyueNum+'</td>'
						htmls+='<td class="center">'+jsonArray[temp].tLoanStartTime+'</td><td class="center">'+jsonArray[temp].tLoanEndTime+'</td><td class="center">'+jsonArray[temp].tStatus+'</td></tr>'
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

	


$('#myloanStartTime').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

$('#myloanEndTime').datetimepicker({
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

    