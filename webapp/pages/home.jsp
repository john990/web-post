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
    <%@include file="include/menu.jsp" %>
    <div class="content-wrap">
        <div class="main-container">
            <div class="main">
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
                                         <span><strong><a href="#">${p.tag}</a></strong></span>
                                    </span>
                                    <span class="posted-by">
                                        &nbsp;•&nbsp; <a href="#"><span>${p.username}</span></a>
                                    </span>
                                    <span class="posted-time">
                                        &nbsp;•&nbsp; </i><span>${p.createAt}</span>
                                    </span>

                                </div>
                            </div>
                            <div class="count">
                               <c:if test="${not empty p.count}"><span class="badge">${p.count}</span></c:if>
                            </div>
                        </li>
                        </c:forEach>
                    </ol>
                </c:if>
            </div>
        </div>
        <div class="slider">slider</div>
    </div>
</body>
</html>