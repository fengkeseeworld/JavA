<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
</head>

<body>
	<table id="person_updateinfor">
		<form action="person/manageaction!manageupdate.action" method="post">
		<input type="hidden" name="empId" value="${empId }">
			<thead>
				<th colspan="2">修改个人信息</th>
			</thead>
			<tbody>
				<tr>
					<td>员工编号</td>
					<td><input name="emp.empId" value="${emp.empId}" readonly />
					</td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input name="emp.empName" value="${emp.empName}" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input name="emp.empGender" value="${emp.empGender}" /></td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input name="emp.empTel" value="${emp.empTel}" /></td>
				</tr>
				<tr>
					<td>住址</td>
					<td><input name="emp.empAddress" value="${emp.empAddress}" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input value="12" /></td>
				</tr>
				<tr>
					<td>身份证</td>
					<td><input name="emp.empCard" value="${emp.empCard}" /></td>
				</tr>
				<tr>
					<td>所属部门</td>
					<td><input readonly name="emp.department.depId"
						value="${emp.department.depId}" /></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><input name="emp.empEmail" value="${emp.empEmail}" /></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input name="emp.empPassword" value="${emp.empPassword}" />
					</td>
				</tr>
				<tr>
					<td>权限</td>
					<td><input readonly name="emp.emproot.emprootId"
						value="${emp.emproot.emprootId}" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td><input readonly name="emp.empstatus.empstatusId"
						value="${emp.empstatus.empstatusId}" /></td>
				</tr>
				<tr>
					<td>工资</td>
					<td><input readonly name="emp.empSalary"
						value="${emp.empSalary}" /></td>
				</tr>
				<tr>
					<td>IP</td>
					<td><input name="emp.empIp" value="${emp.empIp}" /></td>
				</tr>
				<tr>
					<td><input type="reset" class="person_updateinfor_button" value="重置"></td>
					<td><input type="submit" class="person_updateinfor_button" value="提交"></td>
				</tr>
			</tbody>
		</form>
	</table>
</body>
</html>