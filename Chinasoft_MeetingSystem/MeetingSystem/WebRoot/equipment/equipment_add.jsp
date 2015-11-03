<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'equipment_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/cssy.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body class="room_find_body">
    <h2>添加新的设备</h2>
	<form action="<%=basePath%>room/addequipment" method="post">
	<div style="float: right;margin-right: 10px;margin-top: 10px;font-size: 12px;">
			<c:if test="${!empty error}">
				<p style="font-weight: 200;font-style: normal;color: red;">${error }</p>
			</c:if>
		</div>
		<table style="margin-left: 30%;">
			<tr>
				<td>设备编号</td>
				<td><input type="text" name="equipmentNumber" /></td>
			</tr>
			<tr>
				<td>设备名称</td>
				<td><input type="text" name="equipmentName" /></td>
			</tr>
			<tr>
				<td>拥有此设备的会议室ID</td>
				<td><input type="text" placeholder="会议室ID请用逗号隔开"
					name="meetingroomIds" /></td>
			</tr>
		</table>
		<div class="center">
			<input type="reset" value="取消" class="button" /> <input
				type="submit" value="确定" class="button" method="equipmentAdd" />
		</div>
	</form>
  </body>
</html>
