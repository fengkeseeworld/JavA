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

<title>My JSP 'Room_add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/cssy.css" rel="stylesheet" type="text/css" />

</head>

<body class="room_find_body">
	<h2>创建新的会议室</h2>
	<form action="<%=basePath%>room/addMeetingroom" method="post">
		<input type="hidden"	name="empId" value="${empId }">
		<div style="float: right;margin-right: 20px;margin-top: 10px">
			<c:if test="${!empty error}">
				<p style="font-weight: 200;font-style: normal;color: red;">${error }</p>
			</c:if>
		</div>
		<table style="margin-left: 30%;">
			<tr>
				<td>会议室名称</td>
				<td><input type="text" name="roomName" /></td>
			</tr>
			<tr>
				<td>会议室状态</td>
				<td><select name="roomstatusId">
						<option value="1">会议室可用</option>
						<option value="2">会议室停用</option>
				</select></td>
			</tr>
			<tr>
				<td>会议室容纳人数</td>
				<td><input type="text" name="roomSpace" /></td>
			</tr>


		</table>
		<div class="center">
			<input type="reset" value="取消" class="button" /> <input
				type="submit" value="确定" class="button" />

		</div>
	</form>

</body>
</html>
