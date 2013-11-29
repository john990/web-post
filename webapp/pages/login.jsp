<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: kai
  Date: 11/28/13
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>login</title>
</head>
<body style="margin: auto;padding: 200px;">
    <form:form id="form" method="post" modelAttribute="user" cssClass="cleanform">
        <form:input path="name" />
        <form:input path="password" />
        <p><button type="submit">Submit</button></p>
    </form:form>
</body>
</html>
