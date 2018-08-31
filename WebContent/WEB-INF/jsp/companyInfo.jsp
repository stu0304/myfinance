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
											公司详细信息
										</div>
											<div class="hr hr-24"></div>
									<div class="space-24"></div>
							<form id="personForm" class="form-horizontal">
										<input type="hidden" id="companyID" value="${mycomInfo.tComId}"> 
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 公司名称：</label>

										<div class="col-sm-9">
											<input type="text" id="mytCname" class="col-xs-10 col-sm-5" value="${mycomInfo.tComName}" disabled/>
										</div>
									</div>
								
								
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">公司地址：</label>

										<div class="col-sm-9">
											<input type="text" id="comAddress" class="col-xs-10 col-sm-5" value="${mycomInfo.tAddress}"/>
										</div>
									</div>
									<div class="space-4"></div>
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 组织机构代码：</label>

										<div class="col-sm-9">
											<input type="text" id="orgCode"  class="col-xs-10 col-sm-5" value="${mycomInfo.tOrgCode}"/>
										</div>
									</div>
									<div class="space-4"></div>
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 注册资本(万)：</label>

										<div class="col-sm-9">
											<input type="text" id="zhuceziben" name="person.tMobile" class="col-xs-10 col-sm-5" value="${mycomInfo.tZhuciziben}"/>
										</div>
									</div>
									

										<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 企业法人</label>

										<div class="col-sm-9">          
											<input type="text" id="qiyefaren"  class="col-xs-10 col-sm-5" value="${mycomInfo.tFaren}" />
										</div>
									</div>
									<div class="space-4"></div>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" id="mysub" onclick="updatePerson();">
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

  function updatePerson()
  {
	  $.ajax({
	        cache: true,
	        type: "POST",
	        url:"${myappurl}addOrUpdateComJSON.do",
	        data : {
	        	tComId:$("#companyID").val(),
	        	tOrgCode : $("#orgCode").val(),
	        	tAddress : $("#comAddress").val(),
	        	tZhuciziben : $("#zhuceziben").val(),
	        	tFaren:$("#qiyefaren").val()
			},
	        async: true,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        			alert('更新成功!');
	        			 window.location.href="companyInfo.do";
	        		}else{
	        			alert('更新失败!');
	        		}
	        }
	    }); 
	  
  }
	
</script>
</html>

    