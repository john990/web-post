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
    <title></title>
</head>
<body>
${success}
<p>一秒后跳转到首页</p>
<%
//    int waitTime = 1000;
//    String url = "/";
//    String content=waitTime+";URL="+url;
//    response.setHeader("REFRESH",content);
    response.sendRedirect("/");
%>
</body>
</html>
