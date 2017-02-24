<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>choose word</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/own.css" />
<script type="text/javascript" src="js/jquery-3.0.0.min.js">
	
</script>

<script type="text/javascript">
	function cctw(name) {
		var obj = document.getElementById(name);
		obj.style.color = "#999999";
	}

	function cctb(name) {
		var obj = document.getElementById(name);
		obj.style.color = "#000";
	}

	function show() {
		event.stopPropagation();
		alert("show here");
	}

	$(function() {
		$("#CET_6").click(function() {
			$.ajax({
				type : "post",
				url : "chooseWords",
				data : {
					choose_words : "CET_6"
				},
				success : function(data) {
					window.location = "words.jsp";
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		});
		$("#CET_4").click(function() {
			alert("this is cet_4");
			alert(($("#hiddenusername").val()));
		});
	});
</script>
</head>
<body>
	<div class="container">
			<div class="page-header">
				<h1>pick up one</h1>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<a id="cet6" href="javascript:void(0)" style="text-decoration: none;color: #000000;">
						<div class="panel panel-primary" id="CET_6" name="CET_6" onmouseover="cctw('CET_6')" onmouseout="cctb('CET_6')">
							<div class="panel-heading">
								<h3 class="panel-title" style="font-size: 20px;text-align: center;">CET-6</h3>
							</div>
							<div class="panel-body" style="text-align: center;">
								<p>there are 2081 words</p>
								<p>may take 149 days to finish it</p>
							</div>
						</div>
					</a>

					<a id="cet4" href="javascript:void(0)" style="text-decoration: none;color: #000000;">
						<div class="panel panel-primary" id="CET_4" name="CET_4" onmouseover="cctw('CET_4')" onmouseout="cctb('CET_4')">
							<div class="panel-heading">
								<h3 class="panel-title" style="font-size: 20px;text-align: center;">CET-4</h3>
							</div>
							<div class="panel-body" style="text-align: center;">
								<p>there are 4059 words</p>
								<p>may take 200 days to finish it</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">gotta you</h3>
						</div>
						<div class="panel-body">
							<p>content456content456</p>
							<p>content456content456</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">gotta you</h3>
						</div>
						<div class="panel-body">
							<p>content456content456</p>
							<p>content456content456</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--在jsp中 value=${username} 这种写法是可以的
		<input id="hiddenusername" type="text" hidden="hidden" value=${username}/>-->
</body>
</html>