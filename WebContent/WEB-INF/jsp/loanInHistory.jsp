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
											借款历史记录
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														债权公司名称：<input type="text" id="zhaiquanCOMID" class="input-large" />
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
														<th class="center">债权公司名称</th>
														<th class="center">距离还款日(天)</th>
														<th class="center">还款总额(万)</th>
														<th class="center">借款金额(万)</th>
														  <th class="center">借款利率</th>
														    <th class="center">违约金(万)</th>
													    <th class="center">借款时间</th>
													     <th class="center">还款时间</th>
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
                    <span id="lblAddTitle" style="font-weight:bold">资金借款分析</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">设备名称</div>
                                <div class="col-md-9">
                                 <input id="equipNameID" name="tCheckCircle" type="text" class="form-control" disabled/>                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修人员</label>
                                <div class="col-md-9">
                                   <input id="epersonName" name="tCheckCircle" type="text" class="form-control" disabled/> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修日期</label>
                                <div class="col-md-9">
                                <div id="fixdateID" class="input-group date form_date col-md-10"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="tBuyDate" id="equipLogDateId" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修日志记录</label>
                                <div class="col-md-9">
                                       <textarea class="form-control" rows="10" id="fixcontentId"></textarea> 
                                </div>
                            </div>
                        </div>
	                    
                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="elogID" name="ID" />
                    <button type="button" id="myupdateSubID" onclick="updateLog();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					确认借款
				</h4>
			</div>
			<div class="modal-body">
				确定借款开始么？
			</div>
			<div class="modal-footer">
			 <input type="hidden" id="startLoanID"/>
			 <input type="hidden" id="loanInNumParaID"/>
			 <input type="hidden" id="myloanStatus"></input>
             <input type="hidden" id="loanOutComId"></input>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="confirmStartLoanIn('loan')">
					确认
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="myPayModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					确认还款
				</h4>
			</div>
			<div class="modal-body">
				确定还款么？
			</div>
			<div class="modal-footer">
			 <input type="hidden" id="startLoanID"/>
			 <input type="hidden" id="payBackTotalNum"/>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="confirmStartLoanIn('payback')">
					确认
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
		
</body>
<%@include file="commonJS.jsp" %>		
<script>
var pageIndex = 0;        
var pageSize = 10;        

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	mypagination(${countLoanInHistory},pageIndex,pageSize);
	
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

function confirmStartLoanIn(doaction)
{
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}confirmStartLoanIn.do",
	        data : {
	        	tLoanId: $('#startLoanID').val(),
	        	tStatus:	$('#myloanStatus').val(),
	        	tLoanNum:$('#loanInNumParaID').val(),
	        	tChanghuanTotal:$('#payBackTotalNum').val(),
	        	tLoanoutComid:$('#loanOutComId').val(),
	        	tLoaninComid:'${myperson.tComId}',
	        	myaction:doaction
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

	   	    $.get("<%=basePath%>selectLoanInHistory.do",
	   	    	  {
	   	    	    tLoanoutComid: $("#zhaiquanCOMID").val(),
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
							htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tLoaninComid+'</td>'
							
							if(jsonArray[temp].tWarnDays=='-1')
								{
								   htmls+='<td class="center" style="color:red">'+jsonArray[temp].tLoanPreTime+'</td>'
								}else{
									htmls+='<td class="center" style="color:green">'+jsonArray[temp].tLoanPreTime+'</td>'
								}
							htmls+='<td class="center">'+jsonArray[temp].tChanghuanTotal+'</td><td class="center">'+jsonArray[temp].tLoanNum+'</td><td class="center">'+jsonArray[temp].tLixi+'</td><td class="center">'+jsonArray[temp].tWeiyueNum+'</td>'
							htmls+='<td class="center">'+jsonArray[temp].tLoanStartTime+'</td><td class="center">'+jsonArray[temp].tLoanEndTime+'</td><td class="center">'+jsonArray[temp].tStatus+'</td>'
							htmls+='<td class="center"><div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'
							  
							if(jsonArray[temp].tStatus=='债务方已提交') {
								  htmls+='不可操作</div></td></tr>';
							  }
							
							if(jsonArray[temp].tStatus=='债务方已确认') {
							  htmls+='<a class="blue" href="javascript:openPayConfirmWin(\''+jsonArray[temp].tLoanId+'\',\''+jsonArray[temp].tChanghuanTotal+'\',\''+jsonArray[temp].tLoanoutComid+'\');">还款</a></div></td></tr>';
						  }
							  if(jsonArray[temp].tStatus=='债权方已审核') {
								  htmls+='<a class="blue" href="javascript:openDeleteConfirmWin(\''+jsonArray[temp].tLoanId+'\',\''+jsonArray[temp].tLoanNum+'\',\''+jsonArray[temp].tLoanoutComid+'\');">确认借款</a></div></td></tr>';
							  }
							
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

function openDeleteConfirmWin(loanid,loanInNumPara,loanOutComId)
{
	 		$('#startLoanID').val(loanid);
	 		$('#loanInNumParaID').val(loanInNumPara);
	 		$('#loanOutComId').val(loanOutComId);
	 		$('#myloanStatus').val('债务方已确认');
	   		$('#myModal').modal('show');   
}

function openPayConfirmWin(loanId,loanTotal,loanOutComId)
{
	 		$('#startLoanID').val(loanId);
	 		$('#payBackTotalNum').val(loanTotal);
	 		$('#loanOutComId').val(loanOutComId);
	 		$('#myloanStatus').val('债务方已还款');
	   		$('#myPayModal').modal('show');   
}
	



function openAttWin(logid)
{
	openAddWin(logid);	   	
	$("#myupdateSubID").attr("disabled", true);
	   		
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

    