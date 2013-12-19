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
    <strong>${message}</strong>
    <br/>
    <p>${user.email}</p>
    <c:if test="${not empty posts}">
        <ol class="articles" id="infinite-articles">
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
</body>
</html>