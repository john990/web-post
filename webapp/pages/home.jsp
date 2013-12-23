<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <link rel="stylesheet" href="/resources/css/menu.css">
    <link rel="stylesheet" href="/resources/css/home.css">
    <title>home</title>
</head>
<body>
<div>
    <%@include file="include/menu.jsp" %>
    <div class="content-wrap pull-left">
        <div class="main-container">
            <c:if test="${not empty posts}">
            <ol class="articles">
                <c:forEach var="p" items="${posts}">
                    <li class="article">
                    <div class="poster-avatar">
                        <a href="#">
                            <img src="${p.head}" class="img-responsive" onerror="defaultAvatar(this);"/>
                        </a>
                    </div>
                    <div class="article-info">
                        <div class="title">
                            <a href="#"><span>${p.title}</span></a>
                        </div>
                        <div class="minor">
                            <span class="tag">
                                <i class="fa fa-tag"></i><span><strong><a href="#">${p.tag}</a></strong></span>
                            </span>
                            <span class="posted-by">
                                <i class="fa fa-user"></i><a href="#"><span>${p.username}</span></a>
                            </span>
                            <span class="posted-time">
                                <i class="fa fa-clock-o"></i><span>${p.createAt}</span>
                            </span>

                        </div>
                    </div>
                </li>
                </c:forEach>

            </ol>
        </c:if>
        </div>
        <div class="slider">aa</div>
    </div>
</div>
</body>
</html>