<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resource/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="resource/easyui/demo.css">
	<script type="text/javascript" src="resource/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/js/companyTree.js"></script>
</head>
<body>

<div class="easyui-panel" style="padding:5px;width:400px;">
		<ul class="easyui-tree" id="comTreeid">
			
		</ul>
	</div>
<script type="text/javascript">
$('#comTreeid').tree({
	 url:'selectComTreeRoot.do',
	onClick: function(node){
		parent.document.getElementById("${treeID}").value=node.id;
		parent.document.getElementById("${treeText}").value=node.text;
		
		
	}
});



</script>
</body>
</html>