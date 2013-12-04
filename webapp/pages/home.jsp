<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head>
    <%@include file="head.html"%>
    <title>home</title>
</head>
<body>
<a href="/login">login</a><br/>
<a href="/reg">register</a><br/>
    <strong>hello.jsp</strong>
    <br/>
    <br/>
    <span>base:${BASE}</span>
	<p>${message}</p>
    <p>${user.name}</p>
</body>
</html>