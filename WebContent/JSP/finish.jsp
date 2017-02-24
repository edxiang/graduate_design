<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>finish</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<script src="js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		$.ajax({
			type : "post",
			url : "updateRecord",
			success : function(data) {
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
</script>
</head>
<body>
	<div class="container" style="width:700px">
		<div class="well"  style="height:200px">
			<p style="font-size: 30px; text-align: center;">Congratulations!</p>
			<p style="font-size: 30px; text-align: center;">NOW HAVE A REST</p>
			<a href="http://www.bilibili.com">
				<button id="clickme" type="button" class="btn btn-lg btn-success"
					style="float: right;">CLICK ME!</button>
			</a>
		</div>
	</div>
</body>
</html>