<%@ page language="java" import="java.util.*,ms.profile.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<body class="room_find_body">
	<pg:pager url="meeting/meetingSelectAll" index="half-full" maxPageItems="6" maxIndexPages="5" isOffset="false" export="pageOffset,currentPageNumber=pageNumber" scope="request">
		<h2>查询会议</h2>
		<table id="room_find_table">
			<pg:param name="type" value="selectall" />
			<pg:param name="requests" value="1" />
			<pg:param name="empId" value="${empId }"/>
			<tbody>
				<tr>
					<form action="<%=basePath%>meeting/meetingSelectAll?empId=${empId }" method="post">
						<th>条件</th>
						<td><select name="type" >
								<option value="selectall">All</option>
								<option value="meeting_id">Id</option>
								<option value="meeting_name">Name</option>
						</select></td>
						<td>内容</td>
						<td><input type="text" value="" name="requests" /></td>
						<td colspan="4"><input type="submit" class="room_find_table_button"
							 value="查 询"></td>
					</form>
				</tr>
				<tr>
					<th>会议编号</th>
					<th>会议名称</th>
					<th>预订者</th>
					<th>会议状态</th>
					<th colspan="2" >开始时间</th>
					<th colspan="2">结束时间</th>
				</tr>


				<c:if test="${!empty list_select}">
					<c:forEach items="${list_select}" var="meeting">
						<pg:item>
							<tr>
								<td>${meeting.meetId }</td>
								<td>${meeting.meetName }</td>
								<td>${meeting.emp.empId }</td>
								<td>${meeting.meetingstatus.meetingstatusName }</td>
								<td colspan="2">${meeting.meetStarttime }</td>
								<td colspan="2">${meeting.meetEndtime }</td>
							</tr>
						</pg:item>
					</c:forEach>
				</c:if>

				<c:if test="${empty list_select}">
					<tr>
						<td colspan="8" align="center" bgcolor="#EFF3F7">没有找到相应的记录</td>
					</tr>
				</c:if>

				<%-- 定义分页风格：普通风格 --%>
				<tr>
					<td colspan="8"><pg:index>
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
