<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'root_apply.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/cssy.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body class="root_apply_body">
  <h2 align="center">权限申请书</h2>
   <div id="commands" style="float:left;margin-left: 20px;">
			<button type="button" value="bold">Bold</button>
			<button type="button" value="italic">Italic</button>
			<button type="button" value="underline">Underline</button>
		</div>
		<div style="float:left;padding:5px">
			<select id="cmdFontSize">
				<option>选择字体大小</option>
				<option value="1">超小</option>
				<option value="2">小</option>
				<option value="3">较小</option>
				<option value="4">正常</option>
				<option value="5">较大</option>
				<option value="6">大</option>
				<option value="7">超大</option>
			</select>
		</div>
		
		<iframe name="richedit" style="height: 100%; width: 100%" src="<%=basePath%>root/blank.jsp"></iframe>
		<script type="text/javascript" src="js/eventUtil.js" ></script>
		<script type="text/javascript" src="js/richeditor.js"></script>
  </body>
</html>
