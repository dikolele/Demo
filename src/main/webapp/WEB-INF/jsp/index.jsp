<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript" src="WEB-INF/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			$.ajax({
				url:'person/save',
				data:$("#form1").serialize(),
				dataType:'json',
				type:'post',
				success:function(data){					
						alert('添加成功');
				}
			});
		});
	});
	
	
</script>
</head>
<body>
	<form action="" method="post" id="form1">
		姓名：<input type="text" name="name" id="name"><br>
		年龄：<input type="text" name="age" id="age"><br>
		<button id="submit">添加</button>
		<input type="submit" value="提交">
	</form>
	<a href="${pageContext.request.contextPath}/person/query">查询</a>
</body>
</html>