<%@ page import="com.psy.common.SessionAttribute" %>
<%--
  Created by IntelliJ IDEA.
  User: kai.wang
  Date: 12/3/13
  Time: 12:42 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <title>${success}</title>
</head>
<body>
${success}
${url}
<%
    int waitTime = 2;
    Object url = session.getAttribute(SessionAttribute.PRV_URL_LOGIN);
    String content = "";
    if (url != null) {
        session.removeAttribute(SessionAttribute.PRV_URL_LOGIN);
        content = waitTime + ";URL=" + url.toString();
        out.print("2秒后跳转到登录之前页面");
    } else {
        out.print("2秒后跳转到首页");
        content = waitTime + ";URL=/";
    }
    response.setHeader("REFRESH", content);
%>
</body>
</html>
