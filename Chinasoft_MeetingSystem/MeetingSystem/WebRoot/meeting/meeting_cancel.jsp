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

<body class="meeting_find_body">
	<pg:pager url="meeting/meetingSelect" index="half-full"
		maxPageItems="8" maxIndexPages="5" isOffset="false"
		export="pageOffset,currentPageNumber=pageNumber" scope="request">
		<pg:param name="type" value="select all" />
		<pg:param name="requests" value="1" />
		<pg:param name="empId" value="${empId }"/>
		<table class="meeting_finde_stripe">
			<tbody>
				<tr>
					<td colspan="7">所 有 预 订 会 议</td>
				</tr>
				<tr>
					<th>会议编号</th>
					<th>会议名称</th>
					<th>预订者</th>
					<th>会议状态</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>取消预订</th>
				</tr>

				<s:iterator value="#request.list_select_cancel" id="meeting">
				<pg:item>
					<tr>
						<form action="<%=basePath%>meeting/meetingCancel?empId=${empId }" method="post">
							<input type="hidden" name="meeting_id" value="${meeting. meetId}">
							<td><s:property value="meetId" /></td>
							<td><s:property value="meetName" /></td>
							<td><s:property value="emp.empId" /></td>
							<td><s:property value="meetingstatus.meetingstatusName" /></td>
							<td><s:date name="meetStarttime" /></td>
							<td><s:date name="meetEndtime" /></td>
							<td><input type="submit" value="取消"></td>
						</form>
					</tr>
					</pg:item>
				</s:iterator>

				<c:if test="${empty list_select_cancel}">
					<tr>
						<td colspan="7" align="center" bgcolor="#EFF3F7">没有找到相应的记录</td>
					</tr>
				</c:if>

				<%-- 定义分页风格：普通风格 --%>
				<tr>
					<td colspan="7"><pg:index>
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
