<%@page import="Model.Bean.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<link href="./css/HomePageStyle.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/410b195647.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
	user user = new user();
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("user") == null)
		response.sendRedirect("Login.jsp");
	else {
		user = (user) session.getAttribute("user");
	}
	%>
	<%
	if (session.getAttribute("message") != null) {
	%>
	<script>alert("<%=session.getAttribute("message")%>")</script>
	<%
	session.setAttribute("message", null);
	}
	%>
	<header>
		<nav>
			<ul class="nav_link">
				<li><a href="HomePage.jsp">Trang Chủ</a></li>
				<li><a href="UserProfileServlet?uid=<%=user.getUid()%>">Hồ Sơ</a></li>
				<li><a href="LogoutServlet">Đăng Xuất</a></li>
			</ul>
		</nav>
	</header>

	<div class="container">
		<div class="header">
			<i class="far fa-file-pdf"></i>
			<h1>Chuyển PDF sang Word</h1>
			<h3>Nhập file pdf cần chuyển sang word ở dưới</h3>
		</div>

		<div class="main">
			<div class="submain">
				<form action="UploadFileServlet" class="button" method="post" enctype="multipart/form-data">
					<input type="hidden" name="username" value=<%=user.getUsername()%>>
					<i class="far fa-copy"></i> 
					<input type="file" id="file" name="files_upload" accept="application/pdf" multiple size="3000">
					<label for="file">CHỌN CÁC TỆP</label> 
					<input class="submit" type="submit" value="Chuyển đổi!">
				</form>
			</div>
		</div>

	</div>
</body>
</html>
