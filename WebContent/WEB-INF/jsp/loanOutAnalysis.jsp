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
											资金放款分析
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														公司名称：<input type="text" id="comNameLoanInID" class="input-large" />

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
														<th class="center">借款总额</th>
													    <th class="center">借款日期</th>
													    <th class="center">还款日期</th>
													      <th class="center">利率</th>
													     <th class="center">状态</th>
														<th class="center">操作</th>
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
                    <span id="lblAddTitle" style="font-weight:bold">资金放款分析</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                    
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">预警天数</label>
                                <div class="col-md-9">
                                   <input id="yujingtianshu" name="tWarnDays" type="text" class="form-control" /> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">违约金(0.1-0.9)</label>
                                <div class="col-md-9">
                                <input id="weiyuejin" name="tWeiyueNum" type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>
	                    
                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="subloanID"  />
                    <button type="button" id="myupdateSubID" onclick="updateLog();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
		
</body>
<%@include file="commonJS.jsp" %>		
<script>
var pageIndex = 0;        
var pageSize = 10;        

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	mypagination(${detailsCountNum},pageIndex,pageSize);
	
});


function loadPage(pageIndex,pageSize)
{

	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("<%=basePath%>selectLoanOutDetails.do",
	   	    	  {
	   	    	    tChanghuanTotal: $("#comNameLoanInID").val(),
	   	    	    tLoanNum:$("#comZiJin").val(),
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{    
	            	        sno = parseInt(temp)+1;
							htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tChanghuanTotal+'</td><td class="center">'+jsonArray[temp].tLoanNum+'</td>'
							+'<td class="center">'+jsonArray[temp].tLoanStartTime+'</td><td class="center">'+jsonArray[temp].tLoanEndTime+'</td><td class="center">'+jsonArray[temp].tLixi+'</td><td class="center">'+jsonArray[temp].tStatus+'</td><td class="center">'
							+'<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'
							+'<a class="blue" href="javascript:openAttWin(\''+jsonArray[temp].tLoanId+'\');">放款确认</a></div></td></tr>';
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}


//提交更新
function updateLog()
{       
	  $.ajax({
	        type: "POST",
	        url:"${myappurl}updateLoanDetails.do",
	        data : {
	        	tLoanId: $('#subloanID').val(),
	        	tWarnDays:$('#yujingtianshu').val(),
	        	tWeiyueNum:$('#weiyuejin').val()
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

function openAttWin(logid)
{
	$('#subloanID').val(logid);
	$('#addLogWin').modal('show');   
	   		
}

$('#fixdateID').datetimepicker({
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

    