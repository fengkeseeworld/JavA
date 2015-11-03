<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link href="<%=basePath%>css/cssy.css" rel="stylesheet" type="text/css">
<title>My JSP 'register.jsp' starting page</title>

</head>


<body class="main_body">
	<div id="main_box">
		<div id="main_box_header">
			<div id="logo">
				<img src="images/logo.png" alt="logo" />
			</div>
			<div>
				<button class="main_box_header_button"
					onclick="window.location.href='<%=basePath%>person/login.jsp'">登录</button>
			</div>
		</div>

		<div id="main_box_main" style="text-align: center;">
			<h2>用户注册</h2>
			<s:form action="personaction!register.action" namespace="/person"
				method="post">
				<div style="float: right;margin-right: 20px;margin-top: 10px">
					<c:if test="${!empty error}">
						<p style="font-weight: 200;font-style: normal;color: red;">${error }</p>
					</c:if>
				</div>
				<table id="meeting_order_addMeeting" style="margin-left: 30%;">
					<tbody>
						<tr>
							<td>姓名：</td>
							<td><input name="emp.empName" type="text" /></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input name="emp.empPassword" type="text" /></td>
						</tr>
						<tr>
							<td>性别：</td>
							<td><select name="emp.empGender">
									<option value="男">男</option>
									<option value="女">女</option>
							</select></td>
						</tr>
						<tr>
							<td>邮箱：</td>
							<td><input name="emp.empEmail" type="text" /></td>
						</tr>
						<tr>
							<td>手机：</td>
							<td><input name="emp.empTel" type="text" /></td>
						</tr>
						<tr>
							<td>地址：</td>
							<td><input name="emp.empAddress" type="text" /></td>
						</tr>
						<tr>
							<td>证件号：</td>
							<td><input name="emp.empCard" type="text" /></td>
						</tr>
						<tr>
							<td>部门ID：</td>
							<td><select name="emp.department.depId">
									<option value="101" selected="selected">项目部</option>
									<option value="102">技术部</option>
									<option value="103">后勤部</option>
							</select></td>
						</tr>
						<tr>
							
							<td colspan="2" ><input type="submit" value="注册"></td>
						</tr>

					</tbody>

				</table>
				<s:hidden name="emp.emproot.emprootId" label="权限" value="1" />
				<s:hidden name="emp.empstatus.empstatusId" label="状态" value="1" />
				<s:hidden name="emp.empSalary" label="工资" value="5000" />
				<s:hidden name="emp.empIp" />
			</s:form>




		</div>

		<div id="bottom">copyright@meetingSystem</div>
	</div>

</body>

</html>
