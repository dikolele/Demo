<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询</title>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-form.js"></script>
<script type="text/javascript">
	console.log(1);
	$(document).ready(function() {
		console.log(2);
		//删除
		$("button#del").click(function() {
				//var id = $("tr:eq(1) td:eq(0)").text();//获取tr 下 td 的值
				var id = $("input#work").val(); //获取输入框内的值
				console.log("ID = " + id);
				console.log(3);
				var config = {
						type : "post",
						url : "http://localhost:8090/Demo/person/delete",
						data : "id=" + id,
						dataType : "json",
						success : function(data) {
							console.log(4);
							window.location = "http://localhost:8090/Demo/person/query";
						}
				};
				console.log(config);
				$.ajax(config);

			});
		
		//修改
		$("input#modifyBtn").click(function() {
			console.log(33);
			var id = $("input#go").val();
			console.log(id);
			window.location = "http://localhost:8090/Demo/person/update?id="+id;
	});
});
	
	
</script>
</head>
<body>
	<div>
		<input type="text" id="work" name="work" />
		<button id="del">删除</button>
	</div>
		
		<form name="form1" id="form1">
			<input type="text" id="go" name="go"/>
			<input type="button" id="modifyBtn" value="修改"/>
		</form>
	
	
	<table>
		<tr>
			<td>序号</td>
			<td>名字</td>
			<td>年龄</td>
		</tr>

		<c:forEach items="${plist}" var="person">
			<tr>
				<td>${person.id}</td>
				<td>${person.name }</td>
				<td>${person.age }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>