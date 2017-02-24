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
			if (checkUsername() && checkPassword() && checkPhone()) {
			} else {
				return;
			}
			$.ajax({
				type : "post",
				url : "logup",
				data : {
					username : $("#username").val(),
					password : $("#password").val(),
					phone : $("#phone").val()
				},
				success : function(data) {
					window.location = "signInUp.jsp";
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		});
	});
	function checkUsername() {
		var s_username = $("#username").val();
		var reg = /\W+/g;
		if (!s_username) {
			var obj = document.getElementById("wrongUsername");
			obj.innerHTML = '<img src="img/wrong.jpeg" width="20px" />&nbsp;the username can not be null';
			obj.hidden = "";
			return 0;
		}
		if (s_username.match(reg)) {
			var obj = document.getElementById("wrongUsername");
			obj.innerHTML = '<img src="img/wrong.jpeg" width="20px" />&nbsp;only can include E&N&UNDERLINE';
			obj.hidden = "";
			return 0;
		}
		$.ajax({
			type : "post",
			url : "checkUsername",
			dataType : "text",
			data : {
				username : $("#username").val()
			},
			success : function(data) {
				var obj = $.parseJSON(data);
				var state = obj.statement;
				if (state == 1) {
					var obj = document.getElementById("wrongUsername");
					obj.hidden = "hidden";
				} else {
					var obj = document.getElementById("wrongUsername");
					obj.hidden = "";
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
		return 1;
	};
	function checkPassword() {
		var s_password = $("#password").val();
		var obj = document.getElementById("wrongPassword");
		if (s_password.length <= 6) {
			obj.hidden = "";
			return 0;
		} else {
			obj.hidden = "hidden";
			return 1;
		}
	};
	function checkPhone() {
		var s_phone = $("#phone").val();
		var obj = document.getElementById("wrongPhone");
		if (s_phone.length != 11) {
			obj.hidden = "";
			return 0;
		} else {
			obj.hidden = "hidden";
			return 1;
		}
	};
</script>
</head>

<body>
	<div class="container" style="width: 800px;">
		<h2>
			<span class="label label-info">USERNAME:</span> <input id="username"
				name="username" style="width: 250px; display: inline;" type="text"
				class="form-control" placeholder="Username" required autofocus
				onblur="checkUsername()"> <span
				style="font-size: 10px; color: #999999;">combine as
				ENGLISH&NUMBER&UNDERLINE</span>
		</h2>
		<div hidden="hidden" id="wrongUsername"
			style="color: darkgoldenrod; margin-bottom: 10px; background-color: #EEEEEE;">
			<img src="img/wrong.jpeg" width="20px" />&nbsp;the username have
			been used!
		</div>
		<h2>
			<span class="label label-info">PASSWORD:</span> <input id="password"
				name="password" style="width: 250px; display: inline;"
				type="password" class="form-control" placeholder="Password" required
				onblur="checkPassword()"> <span
				style="font-size: 10px; color: #999999;">more than six_length</span>
		</h2>
		<div hidden="hidden" id="wrongPassword"
			style="color: darkgoldenrod; margin-bottom: 10px; background-color: #EEEEEE;">
			<img src="img/wrong.jpeg" width="20px" />&nbsp;the length of
			password should more than six!
		</div>
		<h2>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span
				class="label label-info">PHONE:</span> <input id="phone"
				name="phone" style="width: 250px; display: inline;" type="text"
				class="form-control" placeholder="phone" required
				onblur="checkPhone()"> <span
				style="font-size: 10px; color: #999999;">reset your password
				when you forget it</span>
		</h2>
		<div hidden="hidden" id="wrongPhone"
			style="color: darkgoldenrod; margin-bottom: 10px; background-color: #EEEEEE;">
			<img src="img/wrong.jpeg" width="20px" />&nbsp;the length of phone
			should be eleven;
		</div>

		<p style="margin-bottom: 50px;">
			<button id="done" type="button" class="btn btn-lg btn-success">DONE</button>
		</p>
		<a href="signInUp.jsp"> <span class="label label-default"
			style="font-size: 25px;">back</span>
		</a>
	</div>
</body>

</html>