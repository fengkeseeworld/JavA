<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*,ms.profile.*"
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

<title>My JSP 'amin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>css/cssy.css" rel="stylesheet" type="text/css" />
</head>

<body class="main_body">
	<div id="main_box">
		<div id="main_box_header">
			<div id="logo">
				<img src="images/logo.png" alt="logo" />
			</div>
			<div>
				<ul>
					<li class="main_box_header_button">${emp.empName}登录成功</li>
				</ul>
			</div>
		</div>
		<%
			Emp emp = (Emp) request.getAttribute("emp");
			application.setAttribute("empId", emp.getEmpId());
		%>
		<div id="main_box_main">
			<!--菜单栏  -->
			<div id="main_box_left">
				<ul class="arcordion">
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header">员工系统</div>
						<div class="arcordion item_content">
							<div style="float:left">
								<a
									href="<%=basePath%>person/personaction!find?empId=${emp.empId}"
									target="show">个人信息</a> <br /> <a
									href="<%=basePath%>person/personaction!listAll?empId=${emp.empId}"
									target="show">所有员工信息 </a>
							</div>
							<div style="clear:both"></div>
						</div>
					</li>
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header">会议系统</div>
						<div class="arcordion item_content">
							<div style="float:left;">
								<a href="<%=basePath%>meeting/meeting_order.jsp" target="show">预定会议</a>
								<br /> <a href="<%=basePath%>meeting/meeting_find.jsp"
									target="show">查询会议</a> <br /> <a
									href="<%=basePath%>meeting/meetingSelectUpdate?empId=${emp.empId}"
									target="show">修改会议</a> <br /> <a
									href="<%=basePath%>meeting/meetingSelect?empId=${emp.empId}"
									target="show">取消会议</a>
							</div>
							<div style="clear:both"></div>
						</div>
					</li>
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header">会议室系统</div>
						<div class="arcordion item_content">
							<div style="float:left">
								<a href="<%=basePath%>meetingroom/room_add.jsp" target="show">增加会议室</a>
								<br /> <a href="<%=basePath%>meetingroom/room_find.jsp"
									target="show">查询会议室</a> <br /> <a
									href="<%=basePath%>meetingroom/room_update.jsp" target="show">修改会议室</a>
								<br /> <a
									href="<%=basePath%>room/deleteMeetingroom_select?empId=${emp.empId}"
									target="show">删除会议室</a>
							</div>
							<div style="clear:both"></div>
						</div>
					</li>
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header">设备系统</div>
						<div class="arcordion item_content">

							<div style="float:left">
								<a href="<%=basePath%>equipment/equipment_add.jsp" target="show">设备添加</a>
								<br /> <a href="<%=basePath%>equipment/equipment_find.jsp"
									target="show">查询设备</a> <br /> <a
									href="<%=basePath%>equipment/equipment_update.jsp"
									target="show">设备更新</a> <br /> <a
									href="<%=basePath%>room/delselectequipment?empId=${emp.empId}"
									target="show">设备删除</a>


							</div>
							<div style="clear:both"></div>
						</div>
					</li>
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header">权限系统</div>
						<div class="arcordion item_content">

							<div style="float:left">
								<a href="<%=basePath%>root/root_infor.jsp" target="show">当前权限</a>
								<br /> <a href="<%=basePath%>root/root_apply.jsp" target="show">申请权限</a>
							</div>
							<div style="clear:both"></div>
						</div>
					</li>
					<li class="arcordion arcordion_item">
						<div class="arcordion item_header" onclick="window.opener = null;window.open(' ','_self',' ');window.close()">退出系统</div>
					
					</li>
				</ul>
				<script>
					var items = document
							.getElementsByClassName("arcordion item_header");
					var contents = document
							.getElementsByClassName("arcordion item_content");
					console.log(items[0]);
					for (var i = 0; i < items.length-1; i++) {
						items[i].setAttribute("onclick", "selectItem(" + i
								+ ")");

					}
					function selectItem(index) {
						for (var i = 0; i < contents.length; i++) {
						console.log(contents.length);
							if (index == i) {
								if (contents[i].classList.contains("active")) {
									contents[i].classList.remove("active");
								} else {
									contents[i].classList.add("active");
								}

							}
						}
					}
				
				
				</script>

			</div>

			<!-- 信息栏 -->
			<div id="main_box_right">
				<iframe name="show" scrolling="auto" width="100%"
					style="min-height: 560px"> </iframe>
			</div>

		</div>


		<div id="bottom">copyright@meetingSystem</div>
	</div>

</body>
</html>
