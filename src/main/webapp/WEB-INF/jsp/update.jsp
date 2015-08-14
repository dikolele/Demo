<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/person/update/id/${person.id}" method="post" id="form1">
		姓名：<input type="text" name="name" value="${person1.name }" ><br>
		年龄：<input type="text" name="age" value="${person1.age }" ><br>
		<input type="submit" value="修改">
	</form>
</body>
</html>