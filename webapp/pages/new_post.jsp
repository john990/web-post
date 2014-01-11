<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: kai.wang
  Date: 12/4/13
  Time: 4:02 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front.css">
    <title>post</title>
</head>
<body>
<%@include file="include/nav-001.jsp" %>
<div class="container main">
    <div class="bread-nav">
        <ol class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#">Library</a></li>
            <li class="active">Data</li>
        </ol>
    </div>
    <div class="create-container box">
        <form class="form-horizontal">
            <fieldset>
                <div id="legend" class="">
                    <legend class="">发表一篇文章</legend>
                </div>
                <div class="control-group">
                    <span class="control-label">TITLE</span>
                    <div class="controls">
                        <input type="text" placeholder="title" class="form-control">
                    </div>
                </div>
                <div class="control-group">
                    <div class="content-header">
                        <span class="control-label">CONTENT</span>
                        <a href="#">添加图片</a>
                        <a href="#">添加图片</a>
                    </div>
                    <div class="controls">
                        <div class="textarea">
                            <textarea class="form-control" placeholder="content" rows="10"></textarea>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-default btn-create">Button</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="slide box">
        aaaa
    </div>
</div>
</body>
</html>
