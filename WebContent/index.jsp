<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.0.0.min.js"></script>
<script>
	function ptb(){
		$.post("login.action", {
			"name" : "Balla",
			"password" : "123",
			"message" : "here is the message"
		}, function(data) {	
			//var json = $.parseJSON(data.info);
			$("#info").append(data.password);
		});
		alert("in the end");
	}
</script>
</head>
<body>
	<form action="blog" method="post">
		<input type="text" name="content" /> 
		<input type="submit" value="login" />
	</form>
	<input type="button" value="show" onclick="ptb()" />
	<div id="info"></div>
</body>
</html>