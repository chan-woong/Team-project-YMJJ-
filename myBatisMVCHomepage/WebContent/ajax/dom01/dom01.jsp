<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
   function test() {
      var div = document.getElementsByTagName("div");
      div[0].innerHTML = "태그1";
      div[1].innerHTML = "태그2";
   }

   function sub() {
      var font = document.getElementsByTagName("font");
      var span = font[0].getElementsByTagName("span");
      span[0].innerHTML = "span1";
      span[1].innerHTML = "span2";
   }
</script>
</head>
<body>
	<pre>
		1. 자바스크립트 : CORE, BOM, DOM
		2. DOM - 노드를 취하는 두가지 방법
			1) 다이렉트 액세스: tag, id, class
			2) 상대적 위치 관계 취득 : 어느 노드를 기점으로 그 자식, 부모, 형제와 같은 상대 위치로
	</pre>
	
	<div></div>
	<div></div>
	<input type="button" value="클릭" onclick="test()"/>
	<br/><br/>
	
	<font>
		<span></span>
		<span></span>
		<input type="button" value="클릭" onclick="sub()"/>
	</font>
	
</body>
</html>