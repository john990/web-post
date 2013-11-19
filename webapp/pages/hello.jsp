<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<body>
    <strong>hello.jsp</strong>
    <span>base:${BASE}</span>

	<h1>${message}</h1>
</body>
</html>