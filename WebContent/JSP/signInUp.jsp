<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Signin Template for Bootstrap</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

<script src="js/jquery-3.0.0.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			signin();
		});
	});
	function signin() {
		$.ajax({
			type : "post",
			url : "login",
			data : {
				username : $("#username").val(),
				password : $("#password").val()
			},
			success : function(data) {
				var state = data.statement;
				if (state == 1) {
					window.location = "chooseWords.jsp";
				} else if (state == 0) {
					var obj = document.getElementById("wrongup");
					obj.hidden = "";
					$("#username").val("");
					$("#password").val("");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}

	function keything() {
		if (event.keyCode == 13) {
			signin();
		}
	}
</script>
</head>

<body onkeypress="keything()">
	<div class="container">

		<div class="jumbotron" style="float: left;">
			<h1>Hello, guys!</h1>
			<p>This is the first website I do for myself. Of course, just for
				testing.</p>
			<p>This is the first website I do for myself. Of course, just for
				testing.</p>
			<p>
				<a href="introduce.html" class="btn btn-primary btn-lg">Learn
					more &raquo;</a> <a href="signUp.jsp">
					<button id="logup" class="btn btn-lg btn-primary" type="button"
						style="float: right;">Sign up &uarr;&uarr;</button>
				</a>
			</p>
		</div>

		<div class="form-signin" style="float: left;">
			<h2 class="form-signin-heading">Please sign in</h2>
			<span class="label label-info" style="font-size: 20px;">username</span>
			<input id="username" name="username" type="text" class="form-control"
				placeholder="Username" required autofocus> <span
				style="display: block;">&nbsp;</span> <span class="label label-info"
				style="font-size: 20px;">password</span> <input id="password"
				name="password" type="password" class="form-control"
				placeholder="Password" required>
			<div hidden="hidden" id="wrongup"
				style="color: darkgoldenrod; margin-bottom: 10px; background-color: #EEEEEE;">
				<img src="img/wrong.jpeg" width="20px" />&nbsp;wrong in USERNAME or
				PASSWORD
			</div>
			<button id="login" class="btn btn-lg btn-danger" type="button">Login</button>

			<br /> <a href="getPassword.jsp"> <span>forget password</span>
			</a>
		</div>

		<div style="clear: both;"></div>

	</div>
</body>

</html>