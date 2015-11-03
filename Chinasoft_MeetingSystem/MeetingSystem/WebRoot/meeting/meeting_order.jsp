<%@ page language="java" import="java.util.*,ms.profile.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
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


	<table id="meeting_order_addMeeting">
		<form action="<%=basePath%>meeting/meetingAdd" method="post">
			<tbody>
				<tr>
					<td colspan="2">预定会议</td>
				</tr>
				<tr>
					<td>会议室编号</td>
					<td><input type="text" value="" name="meetingroom_id" /></td>
				</tr>
				<tr>
					<td>预订者</td>
					<td><input type="text" readonly="readonly" name="emp_id"
						value="${empId }" /></td>
				</tr>
				<tr>
					<td>会议名称</td>
					<td><input type="text" value="" name="meetName" /></td>
				</tr>
				<tr>
					<td>参会人员</td>
					<td><input type="text" 
						name="meetParticipants_ids" /></td>
				</tr>
				<tr>
					<td>开始时间</td>
					<td><input type="text" name="meetStarttime"
						onClick="setDayHM(this);" /></td>
				</tr>
				<tr>
					<td>结束时间</td>
					<td><input type="text" name="meetEndtime"
						onClick="setDayHM(this);" /></td>
				</tr>
				<tr>
					<td><input type="reset" class="button_table" value="重置"></td>
					<td><input type="submit" class="button_table" value="提交"></td>
				</tr>
			</tbody>
		</form>
	</table>

	<div id="other" class="meeting_order_addMeeting_others_a">
		<c:if test="${!empty error}">
			<p>${error }</p>
		</c:if>
		<script src="js/Calender.js"></script>
	</div>
	
	<div id="infor" class="meeting_order_addMeeting_others_b">
		本周无通知
	</div>



</body>
</html>
