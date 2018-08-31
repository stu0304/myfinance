<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sidebar" id="sidebar">
					<ul class="nav nav-list">
						<li class="active">
							<a href="">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>
						
                        <c:if test="${myuser.tRole=='财务主管'}">
                          	<li>
							<a href="goToLoanIn.do">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 资金借款分析 </span>
							</a>
						</li>
						<li>
							<a href="loanOutAnalysis.do">
								<i class="icon-calendar"></i>
								<span class="menu-text"> 资金放款分析 </span>
							</a>
						</li>
                          	<li>
							<a href="goToLoanInHistory.do">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 借款历史记录 </span>
							</a>
						</li>
						
						<li>
							<a href="loanOutHistory.do">
								<i class="icon-calendar"></i>
								<span class="menu-text"> 放款历史记录 </span>
							</a>
						</li>
						
						<li>
							<a href="companyInfo.do">
								<i class="icon-list-alt"></i>
								<span class="menu-text"> 公司详细信息 </span>
							</a>
						</li>
						<li>
							<a href="gogoZichanfuzhai.do">
								<i class="icon-list-alt"></i>
								<span class="menu-text"> 资产负债表 </span>
							</a>
						</li>
					<li>
							<a href="gotokeshishebei.do">
								<i class="icon-text-width"></i>
								<span class="menu-text">资金流转风险分析 </span>
							</a>
						</li>
                        </c:if>
                        
                           <c:if test="${myuser.tRole=='超级管理员'}">
                           
                           <li>
							<a href="comsInfo.do">
								<i class="icon-list-alt"></i>
								<span class="menu-text"> 公司信息管理 </span>
							</a>
							</li>
							
							<li>
							<a href="goToDicList.do">
								<i class="icon-tag"></i>
								<span class="menu-text"> 数据字典管理 </span>
							</a>
						</li>
						<li>
							<a href="goToSysUser.do">
								<i class="icon-double-angle-right"></i>
								<span class="menu-text"> 用户管理 </span>
							</a>
						     </li>
                           </c:if>
						
					</ul><!-- /.nav-list -->
				</div>
</body>
</html>