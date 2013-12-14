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
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <title>注册</title>
</head>

<style type="text/css">
</style>
<body >
<div class="container">
    <p id="formsContent">${error}</p>
    <p>${success}</p>
    <form:form id="form" role="form" method="post" modelAttribute="user" class="form-horizontal"
               autocomplete="false"
               data-validator-option="{theme:'simple_right'}">
        <fieldset>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱：</label>

                <div class="col-sm-10">
                    <form:input class="form-control" path="email"
                                data-rule="邮箱:required;email" placeholder="邮箱" value="${user.email}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名：</label>

                <div class="col-sm-10">
                    <form:input class="form-control" path="name"
                                data-rule="用户名:required;name" placeholder="用户名" value="${user.name}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码：</label>

                <div class="col-sm-10">
                    <form:password class="form-control" path="password"
                                data-rule="用户名:required;password" placeholder="密码" value=""/>
                </div>
            </div>
        </fieldset>
        <p>
            <input type="submit" class="btn btn-primary" value="注册">
        </p>
    </form:form>
</div>

<script type="text/javascript">
//    $(document).ready(function() {
//        $("#form").submit(function() {
//            $.post($(this).attr("action"), $(this).serialize(), function(html) {
////                alert(html);
////                $("#formsContent").replaceWith(html);
//                $('html, body').animate({ scrollTop: $("#formsContent").offset().top }, 500);
//            });
//            return false;
//        });
//    });
</script>

</body>
</html>
