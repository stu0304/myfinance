<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="commonJS.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>航天科工财务管理分析系统</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
         .devicePic{width:200px; height:200px; border:1px dotted;}
         .devicePic img{width:100%;height:100%;}
         .detailPicDiv{width:400px; height:300px; border:1px dotted;}
          .detailPicDiv img{width:100%;height:100%;}
         </style> 
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
											资产负债表 
										</div>
											<div class="hr hr-24"></div>
									<div class="space-24"></div>
							<form id="personForm" class="form-horizontal">
										<input type="hidden" id="myuserId" value="${myuser.tUserId}"> 
										<input type="hidden" id="mypersonId" value="${tperson.tPresonId}"> 
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 货币资金(万元)：</label>

										<div class="col-sm-9">
											<input type="text" id="huobizijin"  placeholder="(万元)" class="col-xs-10 col-sm-5"  value="${zcfc.tHuobizijin}"/>
										</div>
									</div>
								
								
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">应收账款(万元)：</label>

										<div class="col-sm-9">
											<input type="text" id="yingshouzhangkuan"  class="col-xs-10 col-sm-5"  placeholder="(万元)"  value="${zcfc.tYingshouzhangkuan}"/>
										</div>
									</div>
									<div class="space-4"></div>
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 固定资产原值(万元)：</label>

										<div class="col-sm-9">
											<input type="text" id="gudingzizhanyuanzhi"  name="person.tMobile" placeholder="(万元)" class="col-xs-10 col-sm-5" value="${zcfc.tGudingzichanyuanzhi}"/>
										</div>
									</div>
									<div class="space-4"></div>
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 累计折旧(万元)：</label>

										<div class="col-sm-9">
											<input type="text" id="leijizhejiu"  name="person.tMobile" placeholder="(万元)" class="col-xs-10 col-sm-5" value="${zcfc.tLeijizhejiu}"/>
										</div>
									</div>
									

										<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 固定资产合计(万元)</label>

										<div class="col-sm-9">
											<input type="text" id="gudingzichanheji"   name="person.tEmail" placeholder="(万元)" class="col-xs-10 col-sm-5"  value="${zcfc.tGudingzichanheji}" />
										</div>
									</div>
										<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 资产合计(万元)</label>

										<div class="col-sm-9">
											<input type="text" id="zichanheji"  name="person.tEmail" placeholder="(万元)" class="col-xs-10 col-sm-5"  value="${zcfc.tZichanheji}" />
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" id="mysub" onclick="updateZcfz();">
												<i class="icon-ok bigger-110"></i>
												提交
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="icon-undo bigger-110"></i>
												重置
											</button>
										</div>
									</div>
									<div class="hr hr-24"></div>
									<div class="space-24"></div>
								</form>
									</div>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content --> 

			</div><!-- /.main-container-inner -->

		</div><!-- /.main-container -->



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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script>

function gudingzichanheji(){
	  var gudingzichanyuanzhi;
	  var leijizhejiu;
	  var gudingzizhanheji;
	  
	  gudingzizhanheji = parseFloat(gudingzichanyuanzhi)-parseFloat(leijizhejiu)
	  alert();
}

function tongji(){
	
	  var huobizijin;
	  var yingshouzhangkuan; 
	  var gudingzichanyuanzhi;
	  var leijizhejiu;
	  var gudingzizhanheji;
	  var zichanheji;
	
	
	($('#huobizijin').val()=='')? huobizijin=0 : huobizijin=$('#huobizijin').val();
	($('#yingshouzhangkuan').val()=='')? yingshouzhangkuan=0 : yingshouzhangkuan=$('#yingshouzhangkuan').val();
	($('#gudingzichanyuanzhi').val()=='')? gudingzichanyuanzhi=0 : gudingzichanyuanzhi=$('#gudingzichanyuanzhi').val();
	($('#leijizhejiu').val()=='')? leijizhejiu=0 : leijizhejiu=$('#leijizhejiu').val();
	($('#gudingzizhanheji').val()=='')? gudingzizhanheji=0 : gudingzizhanheji=$('#gudingzizhanheji').val();
	($('#zichanheji').val()=='')? zichanheji=0 : zichanheji=$('#zichanheji').val();
	
	alert(typeof(gudingzichanyuanzhi));
	gudingzizhanheji = parseFloat(gudingzichanyuanzhi)-parseFloat(leijizhejiu);	
	
	$('#gudingzizhanheji').val(gudingzizhanheji);
	
	return true;
}

  function updateZcfz()
  {
	  $.ajax({
	        type: "POST",
	        url:"${myappurl}addOrUpdateZiChanFuZhai.do",
	        data : {
	        	tHuobizijin:$("#huobizijin").val(),
	        	tYingshouzhangkuan:$("#yingshouzhangkuan").val(),
	        	tGudingzichanyuanzhi : $("#gudingzizhanyuanzhi").val(),
	        	tLeijizhejiu : $("#leijizhejiu").val(),
	        	tGudingzichanheji : $("#gudingzichanheji").val(),
	        	tZichanheji : $("#zichanheji").val(),
	        	
	        	tComId : "${myperson.tComId}"
			},
	        async: true,
	        success: function(data) {
	        	if(data=='allok')
	        		{
	        			alert('更新成功!');
	        			 window.location.href="gogoZichanfuzhai.do";
	        		}else{
	        			alert('更新失败!');
	        		}
	        }
	    }); 
	  
  }
  
	
</script>
</html>

    