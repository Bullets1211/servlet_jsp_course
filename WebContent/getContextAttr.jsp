<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contextInfo</title>
</head>
<body>
<h1>ServletContextList示例</h1>
	作者：<%
	out.print(application.getAttribute("author"));
%>
	@copyright
	
	<hr>
	EL表达式取得作者名称：${author}

</body>
</html>