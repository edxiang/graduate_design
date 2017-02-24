<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
		$("#done")
				.click(
						function() {
							var p1 = $("#password1").val();
							var p2 = $("#password2").val();
							var obj = document.getElementById("password");
							if ((p1.length <= 6) || (p2.length <= 6)) {
								obj.innerHTML = '<img src="img/wrong.jpeg" width="20px" />&nbsp;the length of password should more than 6';
								obj.hidden = "";
								return;
							}
							if (p1 != p2) {
								obj.innerHTML = '<img src="img/wrong.jpeg" width="20px" />&nbsp;password are different';
								obj.hidden = "";
								return;
							}
							$.ajax({
								type : "post",
								url : "setPassword",
								data : {
									password : $("#password1").val()
								},
								success : function(data) {
									window.location = "signInUp.jsp";
								},
								error : function(XMLHttpRequest, textStatus,
										errorThrown) {
									alert(XMLHttpRequest.status);
									alert(XMLHttpRequest.readyState);
									alert(textStatus);
								}
							});
						});
	});
</script>
</head>

<body>
	<div class="container" style="width: 800px;">
		<h2> ${username } </h2>
		<h2>
			<span class="label label-info">PASSWORD</span> <input id="password1"
				name="password1" style="width: 250px; display: inline;"
				type="password" class="form-control" placeholder="password" required
				autofocus> <span style="font-size: 10px; color: #999999;">reset
				your password</span>
		</h2>
		<h2>
			<span class="label label-info">PASSWORD</span> <input id="password2"
				name="password2" style="width: 250px; display: inline;"
				type="password" class="form-control" placeholder="password" required>
			<span style="font-size: 10px; color: #999999;">type again</span>
		</h2>
		<div hidden="hidden" id="password"
			style="color: darkgoldenrod; margin-bottom: 10px; background-color: #EEEEEE;">
		</div>
		<p style="margin-bottom: 50px;">
			<button id="done" type="button" class="btn btn-lg btn-success">DONE</button>
		</p>
	</div>
</body>

</html>