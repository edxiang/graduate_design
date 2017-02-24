<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>testPage</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/own.css" />
<style type="text/css">
.testing {
	width: 615px;
	height: 300px;
	margin: 0px 0px;
	background-color: #eee;
	padding: 75px 0;
	text-align: center;
	font-size: 20px;
	border-radius: 6px;
}

input {
	-web-kit-appearance: none;
	-moz-appearance: none;
	height: 30px;
	border-radius: 4px;
	border: 1px solid #c8cccf;
	color: #6a6f77;
}
</style>
<script type="text/javascript" src="js/jquery-3.0.0.min.js">
	
</script>
<script type="text/javascript">
	var arr_words = new Array();
	var index = 0;
	var flag = 0;
	window.onload = function() {
		$.ajax({
			type : "post",
			url : "wordsToUI",
			dataType : "text",
			success : function(json) {
				var obj = $.parseJSON(json);
				var json_value = obj.result;
				var json_obj = $.parseJSON(json_value);
				toList(json_obj);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}

	function toList(json_obj) {
		for (var i = 0; i < 7; i++) {
			var s = [ json_obj[i]['word'], json_obj[i]['pron'],
					json_obj[i]['means'] ];
			arr_words[i] = s;
		}
		addWords(index);
	}

	function addWords(index) {
		var obj = document.getElementById("MeansOrPron");
		obj.innerHTML = arr_words[index][2];
	}

	function addPron(index) {
		var obj = document.getElementById("MeansOrPron");
		var pronunciation = '<a href="javascript:void(0)"><p  onmouseover="pron()"><audio src="' + arr_words[index][1] + '" autoplay="autoplay"></audio>pronunciation</p></a>';
		obj.innerHTML = pronunciation;
	}

	function pron() {
		$("#MeansOrPron")
				.append(
						'<audio src="' + arr_words[index][1] + '" autoplay="autoplay"></audio>');
	}

	function test() {
		var userInput = $("#userInput").val();
		if (userInput == arr_words[index][0]) {
			if (flag == 0) {
				if (index == 6) {
					index = 0;
					flag = 1;
					$("#userInput").val("");
					addPron(index);
				} else {
					index++;
					$("#userInput").val("");
					addWords(index);
				}
			} else if (flag == 1) {
				if (index == 6) {
					flag = 2;
					$("#userInput").val("");
					able();
				} else {
					index++;
					$("#userInput").val("");
					addPron(index);
				}
			}
		} else {
			alert("wrong words");
			$("#userInput").val("");
		}
	}

	function keything() {
		if (event.keyCode == 13) {
			test();
		}
	}

	function able() {
		var obj = document.getElementById("testDiv");
		obj.innerHTML = "";
		obj.style.padding = "0";
		var s = "";
		for (var i = 0; i < 7; i++) {
			var p = $("<p>" + arr_words[i][0] + "</p>");
			$("#testDiv").append(p);
		}
		var p = $("<p>" + s + "</p>");
		$("#testDiv").append(p);
		var btn = document.getElementById('finish');
		btn.disabled = "";
	}
</script>
</head>
<body onkeypress="keything()">
	<div class="container" style="border: solid #269ABC 1px; width: 650px;">
		<h1>
			<span class="label label-info" style="margin: 0 auto">TESTING:please
				finish them all</span>
		</h1>
		<div id="testDiv" class="testing">
			<span id="MeansOrPron"></span>
			<p style="font-size: 17px; padding-top: 30px;">
				please input the word:&nbsp; <input id="userInput" type="text"
					placeholder="TypeTheWordHere" required autofocus>
				<button id="submit" class="btn btn-primary" type="button"
					onclick="test()">submit</button>
			</p>
		</div>

		<p style="margin-top: 3px;">
			<a href="words.jsp">
				<button type="button" class="btn btn-lg btn-success">BACK</button>
			</a> <a href="finish.jsp">
				<button id="finish" type="button" class="btn btn-lg btn-success"
					style="float: right;" disabled="disabled">FINISH</button>
			</a>
		</p>
	</div>
</body>
</html>