<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'room_delete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/cssy.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body class="room_find_body">
	<pg:pager url="room/deleteMeetingroom_select" index="half-full" maxPageItems="4"
							maxIndexPages="5" isOffset="false"
							export="pageOffset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="type" value="select all"/>
				<pg:param name="requests" value="1"/>
				<pg:param name="empId" value="${empId }"/>
				<h2>删除已有的会议室</h2>
			<table id="room_find_table">
			<tbody>
				<tr>
					<th>会议室ID</th>
					<th>会议室名称</th>
					<th>会议室容量</th>
					<th>会议室状态</th>
					<th>操作</th>
				</tr>
					<c:if test="${!empty list_all}">
								<c:forEach items="${list_all}" var="room">
									<pg:item>
										<tr>
											<td>${room.roomId }</td>
											<td>${room.roomName }</td>
											<td>${room.roomSpace }</td>
											<td>${room.roomstatus.roomstatusName }</td>
											<td><a href="<%=basePath%>room/deleteMeetingroom_delete?roomId=${room.roomId  }&&empId=${empId  }">删除</a></td>
										</tr>
									</pg:item>
								</c:forEach>
							</c:if>

							<c:if test="${empty list_all}">
								<tr>
									<td colspan="6" align="center" bgcolor="#EFF3F7">
										没有找到相应的记录</td>
								</tr>
							</c:if>

							<%-- 定义分页风格：普通风格 --%>
							<tr>
								<td colspan="6"><pg:index>
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
										<pg:next >
											<a href="${pageUrl }">下一页</a>
										</pg:next>
										<pg:last>
											<a href="${pageUrl }">尾页</a>
										</pg:last>
									</pg:index></td>
							</tr>
				

			</tbody>
		</table></pg:pager>
	</body>
</html>
