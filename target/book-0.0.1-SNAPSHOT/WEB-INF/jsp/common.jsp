<%--
  Created by IntelliJ IDEA.
  User: an
  Date: 2020/3/27
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="row">



        <h1>Hello, 图书管理系统！！！</h1>
        <p class="text-center">


        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="${request.contextPath }/book/findAllBooks">书籍管理</a></li>
            <li role="presentation" class="active"><a href="${request.contextPath }/notice/findAllNotice">公告处理</a></li>
        <li role="presentation" class="active"><a href="${request.contextPath }/overdue/findAllOverduce">过期处理</a></li>
            <li role="presentation" class="active"><a href="${request.contextPath }/reader/findReader">借阅者管理</a></li>


        </ul>
        </p>
    </div>

