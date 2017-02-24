<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/own.css" />
<script type="text/javascript" src="js/jquery-3.0.0.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$("#done").click(function() {
			$.ajax({
				type : "post",
				url : "getPassword",
				data : {
					username : $("#username").val(),
					phone : $("#phone").val()
				},
				success : function(data) {
					var state = data.statement;
					if (state == 1) {
						window.location = "setPassword.jsp";
					} else {
						alert("wrong");
						swm();
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		});
	});

	function swm() {
		$("#username").val("");
		$("#phone").val("");
	}
</script>
</head>
<body>
	<div class="container" style="width: 800px;">
		<h2>
			<span class="label label-info">USERNAME:</span> <input id="username"
				name="username" style="width: 250px; display: inline;" type="text"
				class="form-control" placeholder="Username" required autofocus>
		</h2>
		<h2>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span
				class="label label-info">PHONE:</span> <input id="phone"
				name="phone" style="width: 250px; display: inline;" type="text"
				class="form-control" placeholder="Phone" required>
		</h2>
		<p style="margin-bottom: 50px;">
			<button id="done" type="button" class="btn btn-lg btn-success">DONE</button>
		</p>
		<a href="signInUp.jsp"> <span class="label label-default"
			style="font-size: 25px;">back</span>
		</a>
	</div>
</body>
</html>