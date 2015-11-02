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
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>My JSP 'meeting_main.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/cssy.css" rel="stylesheet" type="text/css">

</head>

<body>
	<table id="meeting_update_table">
		<form action="<%=basePath%>meeting/meetingUpdate" method="post">
			<tbody>
				<tr>
					<td colspan="2">修改会议</td>
				</tr>
				<tr>
					<td>会议ID</td>
					<td><input type="text"  name="meeting_id" /></td>
				</tr>
				<tr>
					<td>会议室编号</td>
					<td><input type="text"  name="meetingroom_id" /></td>
				</tr>
				<tr>
					<td>预订者</td>
					<td><input type="text" value="${empId} " readonly="readonly"
						name="emp_id" /></td>
				</tr>
				<tr>
					<td>会议名称</td>
					<td><input type="text"  name="meetName" /></td>
				</tr>
				<tr>
					<td>参会人员</td>
					<td><input type="text" 
						name="meetParticipants_ids" /></td>
				</tr>
				<tr>
					<td>开始时间</td>
					<td><input type="text" name="meetStarttime" readOnly
						onClick="setDayHM(this);" /></td>
				</tr>
				<tr>
					<td>结束时间</td>
					<td><input type="text" name="meetEndtime" readOnly
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
		<c:if test="${!empty list_select_update}">
			<div class="meeting_find_body">
				<table class="meeting_finde_stripe"
					style="width: 250px;margin-top: 10px;">
					<thead>
						<tr>
							<th colspan="3"
								style="text-align: center;font-size: 14px;line-height: 50px;">可修改的会议</th>
						</tr>
						<tr>
							<td>ID</td>
							<td>Name</td>
							<td>StartTime</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.list_select_update" id="meeting">
							<tr style="background-color: #fff">
								<td><s:property value="meetId" /></td>
								<td><s:property value="meetName" /></td>
								<td>${meeting.meetStarttime }</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</c:if>
		
		<c:if test="${empty list_select_update}">
					无可修改会议
					</c:if>
		<script src="js/Calender.js"></script>

	</div>
	<div id="infor" class="meeting_order_addMeeting_others_b">本周无通知</div>
</body>
</html>
