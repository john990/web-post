<%--
  Created by IntelliJ IDEA.
  User: kai.wang
  Date: 12/13/13
  Time: 6:18 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.html" %>
    <title>manage post</title>
</head>
<body>
    <%@include file="include/nav.jsp" %>
    <c:if test="${not empty posts}">
		<ul>
			<c:forEach var="post" items="${posts}">
				<li>${post.title}</li>
			</c:forEach>
		</ul>
	</c:if>

</body>
</html>
