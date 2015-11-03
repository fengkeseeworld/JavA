<%@ page language="java" import="java.util.*,ms.profile.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'meeting_main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/cssy.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquerys-1.5.1.js"></script>
<script language="javascript">
	$(document).ready(function() {
		$(".stripe tr").mouseover(function() {
			//如果鼠标移到class为stripe的表格的tr上时，执行函数   
			$(this).addClass("over");
		}).mouseout(function() {
			//给这行添加class值为over，并且当鼠标一出该行时执行函数   
			$(this).removeClass("over");
		}) //移除该行的class   
		$(".stripe tr:even").addClass("alt");
		//给class为stripe的表格的偶数行添加class值为alt
		//www.divcss5.com 整理特效
	});
</script>
</head>
<!--员工信息列表 -->
<body class="meeting_find_body">
	<pg:pager url="person/personaction!listAll" index="half-full"
		maxPageItems="8" maxIndexPages="76" isOffset="false"
		export="pageOffset,currentPageNumber=pageNumber" scope="request">
		<pg:param name="type" value="select all" />
		<pg:param name="requests" value="1" />
		<pg:param name="empId" value="${empId }"/>
		<table class="meeting_finde_stripe" style="margin-top: 20px;">
			<tbody>
				<tr>
					<td colspan="25">个 人 信 息</td>
				</tr>
				<tr>
					<td>ID</td>
					<td>姓名</td>
					<td>性别</td>
					<td>手机</td>
					<td>住址</td>
					<td>身份证</td>
					<td>所属部门</td>
					<td>邮箱</td>
					<td>权限</td>
					<td>状态</td>
					<td>工资</td>
					<td>IP</td>
					<td colspan="4">操作</td>
				</tr>
				<s:iterator value="#request.list" id="emp">
					<pg:item>
						<tr>
							<td><s:property value="empId" /></td>
							<td><s:property value="empName" /></td>
							<td><s:property value="empGender" /></td>
							<td><s:property value="empTel" /></td>
							<td><s:property value="empAddress" /></td>
							<td><s:property value="empCard" /></td>
							<td><s:property value="department.depName" /></td>
							<td><s:property value="empEmail" /></td>
							<td><s:property value="emproot.emprootName" /></td>
							<td><s:property value="empstatus.empstatusName" /></td>
							<td><s:property value="empSalary" /></td>
							<td><s:property value="empIp" /></td>
							<td><a
								href="person/manageaction!managefind.action?empId=${applicationScope.empId}&&reempId=${emp.empId}">修改</a>
							</td>
							<td><a
								href="person/manageaction!managedelete.action?empId=${applicationScope.empId}reempId=${emp.empId}">删除</a>
							</td>
						</tr>
					</pg:item>
				</s:iterator>
				<%-- 定义分页风格：普通风格 --%>
				<tr>
					<td colspan="16"><pg:index>
							<pg:first>
								<a href="${pageUrl}">首页</a>
							</pg:first>
							<pg:prev>
								<a href="${pageUrl }">上一页</a>
							</pg:prev>
							<pg:pages>
								<c:choose>
									<%--当循环页码是当前页码，则该页码不可以导航，并显示为红色--%>
									<c:when test="${currentPageNumber eq pageNumber}">
										<font color="red">[${pageNumber }]</font>
									</c:when>

									<%-- 当循环页码不是当前页码，则该页码可以导航 --%>
									<c:otherwise>
										<a href="${pageUrl }">[${pageNumber }]</a>
									</c:otherwise>
								</c:choose>
							</pg:pages>
							<pg:next>
								<a href="${pageUrl }">下一页</a>
							</pg:next>
							<pg:last>
								<a href="${pageUrl }">尾页</a>
							</pg:last>
						</pg:index></td>
				</tr>
			</tbody>
		</table>
	</pg:pager>
</body>
</html>