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
    <div class="main-container col-sm-12">
        <c:if test="${not empty posts}">
        <ol>
            <c:forEach var="p" items="${posts}">
                <li class="article">
                    <div class="poster-avatar">
                        <a href="#"><img src="${p.head}" class="img-responsive" onerror="defaultAvatar(this);" /></a>
                    </div>
                    <div class="inner-listing">
                    </div>
                </li>
            </c:forEach>
        </ol>
    </c:if>
    </div>
</div>
</body>
</html>