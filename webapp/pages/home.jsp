<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <title>home</title>
</head>
<body>
    <%@include file="include/nav.jsp" %>
    <c:if test="${not empty posts}">
        <ol class="articles" id="infinite-articles">
            <c:forEach var="p" items="${posts}">
                <li class="article">
                    <div class="poster-avatar">
                        <a href="#"><img src="${p.head}" class="img-responsive" onerror="defaultAvatar(this);" /></a>
                    </div>
                    <div class="inner-listing">
                        <a href="/post/${p.id}">${p.title}</a>
                        <div class="attr">
                            <span class="tag">${p.tag}</span>
                            <span class="time">${p.createAt}</span>
                            <span class="user">${p.username}</span>
                        </div>
                    </div>
                    <div class="count">
                        <span>count</span>
                    </div>
                </li>
            </c:forEach>
        </ol>
    </c:if>
</body>
</html>