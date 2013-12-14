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
    <strong>hello.jsp</strong>
    <br/>
    <br/>
    <span>base:${BASE}</span>
    <p>${user.email}</p>
</body>
</html>