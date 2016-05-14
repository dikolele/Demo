<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
String path = request.getContextPath();  //Demo
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   <!--  http://localhost:8080/Demo/ -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主页</title>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	console.log(1);
	$(document).ready(function() {
		console.log(2);
		$("button#go").click(function() {
			console.log(3);
			var name = $("input#name").val();
			var age = $("input#age").val();
			var data = "name="+name+"&age="+age;
			console.log(data);
			var config = {
					type: "post",
					url:"http://localhost:8090/Demo/person/save",
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
		$("button#go1").click(function(){
			$.ajax({
				type: "get",
				url:"http://localhost:8090/Demo/person/list",
				data: "",
				dataType:"json",
				success:function(data){
					console.log(5);
					window.location="http://localhost:8090/Demo/person/query";
				}
			});
		});
	});
</script>

</head>
<body>
		姓名：<input type="text" name="name" id="name"><br>
		年龄：<input type="text" name="age" id="age"><br>
		<button id="go">添加</button>
		<button id="go1">查询</button>
		
</body>
</html>