<%--
  Created by IntelliJ IDEA.
  User: an
  Date: 2020/3/30
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>POI导出Excel表</title>
</head>
<body>
<div class="input-group-btn" style="text-align: center;">
    <button type="button" class="btn btn-import btn-derive">导出信息</button>
    <button type="button" class="btn btn-export btn-pdf">导出Pdf</button>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $(".input-group-btn")
            .on("click",".btn-derive",doImprotObject) //导出Excel
            .on("click",".btn-pdf",doImportPdf); //导出PDF
    });

    function doImportPdf(){
        location.href="pdf/exportPdf.do";
    }

    function doImprotObject(){
        location.href="http://localhost:8080/export";
    }
</script>
</body>
</html>