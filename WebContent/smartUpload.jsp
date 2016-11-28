<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>smartupload方式文件上传</title>
</head>
<body>
	<%
		String basePath = request.getContextPath();
	%>
	<form method="post" action="<%=basePath%>/smartUpload" enctype="multipart/form-data">
		<p>图片预览：</p>
		<p></p>
		<div id="test-image-preview"
			style="border: 1px solid #ccc; width: 100%; height: 200px; background-size: contain; background-repeat: no-repeat; background-position: center center;">
		</div>
		<p></p>
		<p>
			请选择图片：<input type="file" id="test-image-file" name="test">
		</p>
		<p id="test-file-info"></p>
		<button type="submit">提交</button>
	</form>
	
	<%
		String result = (String) request.getAttribute("result");
		if (result != null) {
			out.println("<span style='color:red'>" + result + "</span><br>");
		}
		
		String json = (String) request.getAttribute("json");
		if (json != null) {
			out.println("<span style='color:red'>" + json + "</span><br>");
		}
	%>

	<script>
		var fileInput = document.getElementById('test-image-file'), 
			info = document.getElementById('test-file-info'), 
			preview = document.getElementById('test-image-preview');
		
		//监听change事件:
		fileInput.addEventListener('change', function() {
			// 清除背景图片:
			preview.style.backgroundImage = '';
			// 检查文件是否选择:
			if (!fileInput.value) {
				info.innerHTML = '没有选择文件';
				return;
			}
			// 获取File引用:
			var file = fileInput.files[0];
			// 获取File信息:
			info.innerHTML = '文件: ' + file.name + '<br>' + '大小: ' + file.size
					+ '<br>' + '修改: ' + file.lastModifiedDate;
			if (file.type !== 'image/jpeg' && file.type !== 'image/png'
					&& file.type !== 'image/gif') {
				alert('不是有效的图片文件!');
				return;
			}
			if(file.fileSize > 512*1024){
				alert('请上传小于512kb的文件!');
				return;
			}
			// 读取文件:
			var reader = new FileReader();
			reader.onload = function(e) {
				var data = e.target.result; // 'data:image/jpeg;base64,/9j/4AAQSk...(base64编码)...'            
				preview.style.backgroundImage = 'url(' + data + ')';
			};
			// 以DataURL的形式读取文件:
			reader.readAsDataURL(file);
		});
	</script>

</body>
</html>