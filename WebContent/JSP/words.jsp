<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/own.css" />
<script type="text/javascript" src="js/jquery-3.0.0.min.js">
	
</script>

<script type="text/javascript">
	window.onload = function() {
		$.ajax({
			type : "post",
			url : "wordsToUI",
			dataType : "text",
			success : function(json) {
				var obj = $.parseJSON(json);
				var json_value = obj.result;
				var json_obj = $.parseJSON(json_value);
				addWords(json_obj);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	function addWords(json_obj) {
		for (var i = 0; i < 7; i++) {
			var tr1 = $("<tr></tr>");
			var path = json_obj[i]['pron'];
			var td0 = $("<td>" + json_obj[i]['word'] + "</td>");
			var td1 = $('<td><a href="javascript:void(0)" id="' + path
					+ '" name="' + json_obj[i]['word']
					+ '" onmouseover="appendstm(this)">'
					+ json_obj[i]['symbols'] + '</a></td>');
			var td2 = $("<td>" + json_obj[i]['means'] + "</td>");
			tr1.append(td0);
			tr1.append(td1);
			tr1.append(td2);
			$("tbody").append(tr1);
		}
	}

	function appendstm(e) {
		//event.target.name 能够成功获取属性为name的值，但是自己添加的属性值好像并不会被获取
		var sname = 'a[name="' + event.target.name + '"]';
		//利用jquery选择器是可以用字符串的
		$(sname)
				.append(
						'<audio src="' + event.target.id + '" autoplay="autoplay"></audio>');

		//由于name和id的值是在创建的时候加上去的，因此每当鼠标滑过音标时，便会动态添加发音。
	}
</script>
</head>
<body>
	<div class="container"
		style="border: dashed #269ABC 1px; width: 800px;">
		<h1>
			<span class="label label-info">CET-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x
				words still left</span>
		</h1>
		<div class="row">
			<div class="col-md-6">
				<table class="table table-striped" style="width: 700px;">
					<thead>
						<tr>
							<th>word</th>
							<th>Symbol</th>
							<th>means</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>

		<p>
			<a href="testPage.jsp"><button style="float: right"
					type="button" class="btn btn-lg btn-success">Test</button></a>
		</p>
	</div>
</body>
</html>