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
        function deleteOverdue(overdueId) {
            var flag = confirm("你确定要删除吗？");
            if (flag) {
                $.ajax({
                    url : "${pageContext.request.contextPath }/overdue/deleteOverdue",
                    //在没有返回值之前，锁定服务器如果是true会开启同步，执行两个线程
                    async : false,
                    type : "POST",
                    data : {
                        overdueId : overdueId
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
    </script>
</head>
<body>

<div class="container-fluid" style="margin: 30px">
    <jsp:include page="common.jsp"></jsp:include>



        <!-- 过期名单信息 -->
        <table class="table table-hover">

            <td class="success">过期名单ID</td>
            <td class="success">过期书名</td>
            <td class="success">过期借阅者姓名</td>
            <td class="success">已经超期的天数</td>

            <td class="info">操作</td>



            <c:forEach items="${pageInfo.list}" var="list" varStatus="id">
                <!-- On rows -->


                <tr>

                    <td>${list.overdueId}</td>
                    <td>${list.bookName}</td>
                    <td>${list.readerName}</td>
                    <td>${list.overdueDate}</td>

                    <td>
                        <button type="button" class="btn btn-info">
                            <li role="presentation" class="active">

                                <a href="#" onclick="deleteOverdue('${list.overdueId}')">删除该过期信息</a>

                            </li>
                        </button>


                    </td>


                </tr>
            </c:forEach>



        </table>
    <br />
    <div class ="text-center">
        <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录</p>
        <a href="/overdue/findAllOverduce?pageNo=${pageInfo.firstPage}">第一页</a>
        <c:if test="${pageInfo.hasPreviousPage }">
            <a href="/overdue/findAllOverduce?pageNo=${pageInfo.pageNum-1}">上一页</a>
        </c:if>

        <c:if test="${pageInfo.hasNextPage }">
            <a href="/overdue/findAllOverduce?pageNo=${pageInfo.pageNum+1}">下一页</a>
        </c:if>

        <a href="/overdue/findAllOverduce?pageNo=${pageInfo.lastPage}">最后页</a>

    </div>
    </div>
</div>
</body>
</html>