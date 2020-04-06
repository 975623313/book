<%--
  Created by IntelliJ IDEA.
  User: an
  Date: 2020/3/27
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br><br><br>

<ul class="nav nav-tabs">
    <li role="presentation" class="active"><a
            href="${request.contextPath }/user/findUserBooks">书籍搜索</a></li>
    <li role="presentation" class="active"><a
            href="${request.contextPath }/user/findUserNotice">用户公告查看</a></li>
    <li role="presentation" class="active"><a
            href="${request.contextPath }/user/findUserBorrow/${readers.readerId}">用户自己借书管理</a></li>


</ul>

