<%@ page language="java" import="java.util.*,ms.profile.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

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

<body class="meeting_find_body" >

				<table class="meeting_finde_stripe" style="width: 600px;margin-top: 20px;">
					<tbody>
						<tr>
							<td colspan="7">个   人   信   息</td>
						</tr>
						<tr><td>姓名</td><td><s:property value="emp.empName"/> </td></tr>
						<tr><td>性别</td><td><s:property value="emp.empGender"/> </td></tr>
						<tr><td>手机</td><td><s:property value="emp.empTel"/> </td></tr>
						<tr><td>住址</td><td><s:property value="emp.empAddress"/> </td></tr>
						<tr><td>身份证</td><td><s:property value="emp.empCard"/> </td></tr>
						<tr><td>所属部门</td><td><s:property value="emp.department.depName"/> </td></tr>
						<tr><td>邮箱</td><td><s:property value="emp.empEmail"/> </td></tr>
						<tr><td>权限</td><td><s:property value="emp.emproot.emprootName"/> </td></tr>
						<tr><td>状态</td><td><s:property value="emp.empstatus.empstatusName"/> </td></tr>
						<tr><td>工资</td><td><s:property value="emp.empSalary"/> </td></tr>
						<tr><td>IP</td><td><s:property value="emp.empIp"/> </td></tr>
						<tr><td colspan="2" ><input type="button"><a href="person/manageaction!managefind.action?empId=${applicationScope.empId}&&reempId=${emp.empId}">修改个人信息</a></td></tr>
					</tbody>
				</table>				
	
</body>
</html>

