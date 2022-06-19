<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link href="./css/LoginStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("user") != null)
		response.sendRedirect("HomePage.jsp");
	%>
	<%
	if (session.getAttribute("message") != null) {
	%>
	<script>alert("<%=session.getAttribute("message")%>
		")
	</script>
	<%
	session.setAttribute("message", null);
	}
	%>
	<div class="form">
		<h1>Đăng nhập</h1>
		<form action="CheckLoginServlet" method="post" class="txt_contain">
			<div class="txt_field">
				<input type="text" name="username" placeholder="Tên đăng nhập">
			</div>
			<div class="txt_field">
				<input type="password" name="password" placeholder="Mật khẩu">
			</div>
			<input type="submit" name="submit" value="Đăng nhập">
		</form>
	</div>
</body>
</html>
