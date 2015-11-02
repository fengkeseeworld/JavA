<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录界面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/cssy.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="main_body">
		<div id="main_box_header">
			<div id="logo">
				<img src="<%=basePath%>images/logo.png" alt="logo" />
			</div>
		</div>

		<div id="main_box_main">
			<h2 align="center">登录会议系统</h2>
			
			<div class="login">

				<s:form action="personaction!login.action" namespace="/person"
					method="post">
					<ul　>
						<li class="main_box_main_title">用户名</li>
						<li><input type="text" name="empEmail" placeholder="请输入用户名" /></li>
						<li class="main_box_main_title">密码</li>
						<li><input type="password" name="empPassword" placeholder="请输入密码" /></li>
						<li><input type="submit" value="登录"><input type="button" value="注册" onclick="window.location.href='person/register.jsp'" /></li>
					</ul>
				</s:form>
				
			</div>

		</div>

		<div id="bottom">copyright@meetingSystem</div>
	</div>

</body>
</html>
