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
    <script type="text/javascript" src="/resources/js/page/new-post.js"></script>
    <title>create post</title>
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
        <form:form id="form" role="form" method="post" class="form-horizontal"
                   modelAttribute="post" cssClass="hide1" autocomplete="false">
            <fieldset>
                <div id="legend" class="">
                    <legend class="">发表一篇文章</legend>
                </div>
                <div class="control-group">
                    <span class="control-label">文章标题</span>
                    <div class="controls">
                        <form:input id="title" path="title" name="title" placeholder="一句话概括你要表达的内容"
                                    class="form-control"/>
                    </div>
                </div>
                <div class="control-group">
                    <div class="content-header">
                        <span class="control-label">正文</span>
                        <a href="#">添加图片</a>
                        <a href="#">添加图片</a>
                    </div>
                    <div class="controls">
                        <div class="textarea">
                             <form:textarea id="content" path="content" value="${post.content}"
                                            class="form-control" placeholder="你要说什么？" rows="10"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="submit" class="btn btn-default btn-create">完成</button>
                    </div>
                </div>
            </fieldset>
        </form:form>
    </div>
    <div class="slide box">
        aaaa
    </div>
</div>
</body>
</html>
