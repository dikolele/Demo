<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
<script type="text/javascript"src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("button#xiugai").click(function() {
		console.log(3);
		var id = $("input#id").val();
		var name = $("input#name").val();
		var age = $("input#age").val();
		var data = "id="+id+"&name="+name+"&age="+age;
		console.log(data);
		var config = {
				type: "post",
				url:"http://localhost:8090/Demo/person/updateto",
				data: data,
				dataType:"json",
				success:function(data){
					console.log(4);
					window.location="http://localhost:8090/Demo/person/query";
				}
			};
		console.log(config);
		$.ajax(config);
		
	}); 
});
</script>
</head>
<body>
		序号：<input type="text" id="id" value="${person.id }" ><br>
		姓名：<input type="text" id="name" value="${person.name }" ><br>
		年龄：<input type="text" id="age" value="${person.age }" ><br>
		<button id="xiugai">提交修改</button>

</body>
</html>