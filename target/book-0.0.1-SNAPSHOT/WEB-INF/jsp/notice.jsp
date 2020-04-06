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

<script type="text/javascript">
	function deleteRule(ruleId) {
		var flag = confirm("你确定要删除吗？");
		if (flag) {
			$.ajax({
				url : "${pageContext.request.contextPath }/rule/deleteRule",
				//在没有返回值之前，锁定服务器如果是true会开启同步，执行两个线程
				async : false,
				type : "POST",
				data : {
					ruleId : ruleId
				},
				success : function(data) {
					if ("success" == data) {
						alert("删除成功");
						location.reload();
					} else {
						alert("没有成功")
					}
				}
			});
		}
	}
	
	
	function deleteInfo(infoId) {
		var flag = confirm("你确定要删除吗？");
		if (flag) {
			$.ajax({
				url : "${pageContext.request.contextPath }/info/deleteInfo",
				//在没有返回值之前，锁定服务器如果是true会开启同步，执行两个线程
				async : false,
				type : "POST",
				data : {
					infoId : infoId
				},
				success : function(data) {
					if ("success" == data) {
						alert("删除成功");
						location.reload();
					} else {
						alert("没有成功")
					}
				}
			});
		}
	}
	
	
	
	
	<%--function deleteOverdue(overdueId) {--%>
		<%--var flag = confirm("你确定要删除吗？");--%>
		<%--if (flag) {--%>
			<%--$.ajax({--%>
				<%--url : "${pageContext.request.contextPath }/overdue/deleteOverdue",--%>
				<%--//在没有返回值之前，锁定服务器如果是true会开启同步，执行两个线程--%>
				<%--async : false,--%>
				<%--type : "POST",--%>
				<%--data : {--%>
					<%--overdueId : overdueId--%>
				<%--},--%>
				<%--success : function(data) {--%>
					<%--if ("success" == data) {--%>
						<%--alert("删除成功");--%>
						<%--location.reload();--%>
					<%--} else {--%>
						<%--alert("没有成功")--%>
					<%--}--%>
				<%--}--%>
			<%--});--%>
		<%--}--%>
	<%--}--%>
	
	
	
	
</script>
</head>
<body>

	<div class="container-fluid" style="margin: 30px">
		<jsp:include page="common.jsp"></jsp:include>
		<!-- On rows -->
		<table class="table table-hover">
			<tr class="tasks-bar">
			<td class="active">规章制度ID</td>
				<td class="active">规章制度顺序权重</td>
				<td class="active">规章制度</td>
				<td class="info">操作</td>
			</tr>
			<c:forEach items="${listR}" var="listR" varStatus="id">
				<!-- On rows -->
				<tr>
				<td>${listR.ruleId}</td>
					<td>${listR.orderRule}</td>
					<td>${listR.ruleContent}</td>


					<td>

						<button type="button" class="btn btn-info">
							<li role="presentation" class="active">
								<!--  <a href="${pageContext.request.contextPath }/book/deleteOneBook/${list.bookId}">减少一本</a>-->
								<a href="#" onclick="deleteRule('${listR.ruleId}')">删除该规章制度</a>

							</li>
						</button>
						<button type="button" class="btn btn-info"><li role="presentation" class="active">
								 <a href="${pageContext.request.contextPath }/rule/showupdateRule/${listR.ruleId}">更新该规章制度</a>
								

							</li></button>
					</td>


				</tr>
			</c:forEach>

		</table>



		<table class="table table-hover">

			<td class="success">系统信息ID</td>
			<td class="success">系统顺寻权重</td>
			<td class="success">系统信息</td>

			<td class="info">操作</td>




			<!-- 系统信息 -->
			<c:forEach items="${listI}" var="listI" varStatus="id">
				<!-- On rows -->


				<tr>

					<td>${listI.infoId}</td>
					<td>${listI.orderInfo}</td>
					<td>${listI.systemInfo}</td>

					<td>
					<button type="button" class="btn btn-info">
							<li role="presentation" class="active">
								<!--  <a href="${pageContext.request.contextPath }/book/deleteOneBook/${list.bookId}">减少一本</a>-->
								<a href="#" onclick="deleteInfo('${listI.infoId}')">删除该系统信息</a>

							</li>
						</button>
						<button type="button" class="btn btn-info"><li role="presentation" class="active">
								 <a href="${pageContext.request.contextPath }/info/showupdateInfo/${listI.infoId}">更新该系统信息</a>
								

							</li></button>
					
					</td>


				</tr>
			</c:forEach>



		</table>

		<%--<div class ="text-center">--%>
			<%--<p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }--%>
				<%--页,总 ${pageInfo.total } 条记录</p>--%>
			<%--<a href="/notice/findAllNotice?pageNo=${pageInfo.firstPage}">第一页</a>--%>
			<%--<c:if test="${pageInfo.hasPreviousPage }">--%>
				<%--<a href="/notice/findAllNotice?pageNo=${pageInfo.pageNum-1}">上一页</a>--%>
			<%--</c:if>--%>

			<%--<c:if test="${pageInfo.hasNextPage }">--%>
				<%--<a href="/notice/findAllNotice?pageNo=${pageInfo.pageNum+1}">下一页</a>--%>
			<%--</c:if>--%>

			<%--<a href="/notice/findAllNotice?pageNo=${pageInfo.lastPage}">最后页</a>--%>

		<%--</div>--%>
		<%----%>
		
		
		<div class="row">
			<br /> <br /> 

			<div class="col-md-6 col-md-offset-3">
				<p class="text-center">
					<button type="button" class="btn btn-warning">
						<li role="presentation" class="active"><a
							href="${request.contextPath }/booktest/addRule">添加规章制度</a></li>
					</button>
					<button type="button" class="btn btn-warning">
						<li role="presentation" class="active"><a
							href="${request.contextPath }/booktest/addInfo">添加系统信息</a></li>
					</button>
				</p>
			</div>
			<br /> <br /> <br /> <br />
			
			
				<!-- 过期名单信息 -->




		</div>
	</div>
</body>
</html>
