<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询</title>
</head>
<body>
	<table>
  		<tr>
  			<td>序号</td>
  			<td>名字</td>
  			<td>年龄</td>
  			<td>操作1</td>
  			<td>操作2</td>
  		</tr>
		
		<c:forEach items="${plist}" var="person">
			
		
    	<tr>
    		<td>${person.id}</td>
    		<td>${person.name }</td>
    		<td>${person.age }</td>
    		<td><a href="update/id/${person.id}">修改</a></td>
    		<td><a href="delete/id/${person.id}">删除</a></td>
    	</tr>
    	
    	</c:forEach>
    </table>
</body>
</html>