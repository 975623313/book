<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>


<title></title>


<script type="text/javascript">
	function deleteReader(readerId) {
		var flag = confirm("你确定要删除吗？");
		if (flag) {
			$
					.ajax({
						url : "${pageContext.request.contextPath }/reader/deleteReader",
						//在没有返回值之前，锁定服务器如果是true会开启同步，执行两个线程
						async : false,
						type : "POST",
						data : {
							readerId : readerId
						},
						success : function(data) {
							if ("success" == data) {
								alert("删除成功");
								location.reload();
							} else {
								alert("没有该用户")
							}
						}
					});
		}
	}

	
</script>
</head>
<body>

	<div class="container-fluid" style="margin: 30px">
		<jsp:include page="common.jsp"></jsp:include>
		<table class="table table-hover">
			<!-- On rows -->
			<tr class="tasks-bar">
				<td class="active">借阅者姓名</td>
				<td class="success">借阅者住址</td>
				<td class="success">借阅者联系方式</td>
				<td class="success">读者ID</td>
				<td class="danger">借书ID</td>
				<td class="warning">查看借阅者未还的书籍</td>
				<td class="danger">操作</td>


			</tr>


			

				<tr>
					<td>${reader.readerName}</td>
					<td>${reader.readerAddress}</td>
					<td>${reader.readerContact}</td>
					<td>${reader.readerId}</td>
					<td>${reader.borrowId}</td>
					<td><button type="button" class="btn btn-warning">
							<a href="${pageContext.request.contextPath }/user/findUserBorrowBook/${reader.readerId}">查看自己的未还的书籍</a>
						</button></td>
				<!-- 
					<td>
						<button type="button" class="btn btn-warning">
							<li role="presentation" class="active"><a href="#"
								onclick="deleteReader('${list.readerId}')">拉黑该用户</a></li>
						</button>
						<button type="button" class="btn btn-info">管理处罚该用户</button>

						<button type="button" class="btn btn-success">
<li role="presentation" class="active"><a href="#" onclick="IsshowBorrow('${list.readerId}')">借阅者借书${list.readerId}</a></li>
						</button>
						
						<a id="alink" href="${pageContext.request.contextPath }/borrow/showBorrow/${list.readerId}"></a> 
						


					</td> -->


				</tr>

	

		</table>
		<div class ="text-center">
			<p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
				页,总 ${pageInfo.total } 条记录</p>
			<a href="/book/findAllBooks?pageNo=${pageInfo.firstPage}">第一页</a>
			<c:if test="${pageInfo.hasPreviousPage }">
				<a href="/book/findAllBooks?pageNo=${pageInfo.pageNum-1}">上一页</a>
			</c:if>

			<c:if test="${pageInfo.hasNextPage }">
				<a href="/book/findAllBooks?pageNo=${pageInfo.pageNum+1}">下一页</a>
			</c:if>

			<a href="/book/findAllBooks?pageNo=${pageInfo.lastPage}">最后页</a>

		</div>
	<!-- 	<div class="row">
			<br /> <br /> <br /> <br />

			<div class="col-md-6 col-md-offset-3">
				<p class="text-center">
					<button type="button" class="btn btn-success">
						<li role="presentation" class="active"><a
							href="${pageContext.request.contextPath }/addReader">添加借阅者</a></li>
					</button>
				</p>
			</div>
		</div> -->
	</div>
</body>
</html>
