<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<body>
    <strong>hello.jsp</strong>
    <br/>
    <span>pageContext:${pageContext.request}</span>
    <br/>
    <span>base:${BASE}</span>
123123
	<h1>${message}</h1>
</body>
</html>