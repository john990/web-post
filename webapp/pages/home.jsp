<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.html" %>
    <title>home</title>
</head>
<body>
<a href="/login">login</a><br/>
<a href="/reg">register</a><br/>
<a href="/new/post">new post</a><br/>
<a href="/logout">logout</a><br/>
    <strong>hello.jsp</strong>
    <br/>
    <br/>
    <span>base:${BASE}</span>
    <p>${user.email}</p>
</body>
</html>