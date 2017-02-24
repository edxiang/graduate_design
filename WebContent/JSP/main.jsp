<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/own.css" />
<script>
	/* function getContent() {
		$.post("getBlog.action", function(data) {
			alert("what the hell");
			$("#blogContent").append(data.content);
		});
	} */

	/* function getContent(){
		$.get("getBlog.action", function(data){
			alert("success:" + data.content);
		});
	} */

	function getContent() {
		$.ajax({
			type : "GET",
			url : "test.action",
			dataType : "text",//{"user":{"password":"JSON","name":"JSONTest","id":"123"}}
			success : function(data) {
				$("#blogContent").append(data);
				var obj = $.parseJSON(data);
				for(var attr in obj.blog){
					alert(obj.blog[attr]);
				}
				alert("success in jsp");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},
			complete : function(data) {
				//alert(data);
			}
		});
	}
</script>
</head>

<body>
	<!-- <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Bootstrap theme</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#picture">Picture</a></li>
				<li><a href="#music">Music</a></li>
				<li><a href="#video">Video</a></li>
				<li><a href="#blog">blog</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
		</div>
		/.nav-collapse
	</div>
	</nav> -->

	<div class="container theme-showcase" role="main">

		<!-- <div class="jumbotron">
			<h1>Hello, guys!</h1>
			<p>This is the first website I do for myself. Of course, just for
				testing</p>
			<p>
				<a href="" class="btn btn-primary btn-lg" role="button">Learn
					more &raquo;</a>
			</p>
		</div> -->

		<!-- <div id="picture" class="page-header">
			<h1>This is the gallery of my picture</h1>
		</div>
		<img class="picture-frame" src="img/moon1.JPG" width="200px" /> <img
			class="picture-frame" src="img/moon2.JPG" width="200px" /> <img
			class="picture-frame" src="img/moon3.JPG" width="200px" /> <img
			class="picture-frame" src="img/moon4.JPG" width="200px" /> <img
			class="picture-frame" src="img/moon5.JPG" width="200px" /> <img
			class="picture-frame" src="img/moon6.JPG" width="200px" />

		<div id="music" class="page-header">
			<h1 style="color: darkblue">This is the music I like most. So I
				hope you can enjoy them too!</h1>
		</div>
		<audio class="audio-backgroundcolor" src="audio/åç¬ - æåº.mp3"
			controls="controls"></audio>
		</br>
		<audio class="audio-backgroundcolor" src="audio/双笙 - 采茶纪.mp3"
			controls="controls"></audio>

		<div id="video"></div>
		<div class="page-header">
			<h1>There are some video I pick. As the same, just enjoy!</h1>
		</div>
		<video class="video-border" src="video/COME.mp4" controls="controls"
			width="1024px"></video> -->

		<div id="blog" class="page-header">
			<h1>Maybe, I can write my diary here.</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<form action="blog" method="post">
						<textarea class="form-control" rows="15" id="blogContent"
							placeholder="type content here" name="content"></textarea>
						<button type="submit" class="btn btn-lg btn-primary"
							style="margin-top: 5px;">Save</button>
					</form>
					<button class="btn btn-lg btn-primary" style="margin-top: 5px;"
						onclick="getContent()">Show</button>
				</div>
			</div>
		</div>

		<div class="page-header">
			<h1>Carousel</h1>
		</div>
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="img/1.JPG" alt="First slide">
				</div>
				<div class="item">
					<img src="img/2.JPG" alt="Second slide">
				</div>
				<div class="item">
					<img src="img/3.JPG" alt="Third slide">
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/docs.min.js"></script>
</body>

</html>