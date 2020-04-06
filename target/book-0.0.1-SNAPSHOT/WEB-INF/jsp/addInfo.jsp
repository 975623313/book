<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css"
	rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>


<title></title>
</head>
<body>

	<div class="container-fluid" style="margin: 30px">
		<jsp:include page="common.jsp"></jsp:include>
		<div class="row">





<form action="${pageContext.request.contextPath }/info/insertInfo" method="post" class="definewidth m20">
			<table class="table table-bordered table-hover definewidth m10">
		
				<tr>
					<td class="tableleft">规章制度ID(相当于显示出来的顺序)</td>
					<td><input type="text" name=orderInfo /></td>
				</tr>
				<tr>
					<td class="tableleft">规章制度</td>
					<td><input type="text" name="systemInfo" /></td>
				</tr>

			<tr>
					<td class="tableleft"></td>
					<td>
						<input type="submit" class="btn btn-primary" value="添加">
						
					</td>
				</tr>
			</table>
		</form>




		</div>
	</div>
</body>
</html>
