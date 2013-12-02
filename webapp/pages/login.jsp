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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/jquery.validator.css">
    <script type="text/javascript" src="/resources/js/jquery-1.10.2.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <script type="text/javascript" async="" src="/resources/js/jquery.validator.js"></script>
    <![endif]-->
    <title>login</title>
</head>

<style type="text/css">
</style>
<body >
<div class="container">
    <p id="formsContent"></p>
    <form:form id="form" role="form" method="post" modelAttribute="user" class="form-horizontal"
               autocomplete="false"
               data-validator-option="{theme:'simple_right'}">
        <fieldset>
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名：</label>

                <div class="col-sm-10">
                    <form:input class="form-control" path="name"
                                data-rule="用户名:required;username" placeholder="用户名" value="${user.name}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码：</label>

                <div class="col-sm-10">
                    <form:password class="form-control" path="password"
                                data-rule="用户名:required;password" placeholder="密码" value=""/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱：</label>

                <div class="col-sm-10">
                    <form:input class="input" path="email" data-rule="邮箱:required;email"
                                placeholder="EMAIL" value="${user.email}"/>
                </div>
            </div>
        </fieldset>
        <p>
            <input type="submit" class="btn btn-primary" value="注册">
        </p>
    </form:form>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form").submit(function() {
            $.post($(this).attr("action"), $(this).serialize(), function(html) {
                $("#formsContent").replaceWith(html);
                $('html, body').animate({ scrollTop: $("#formsContent").offset().top }, 500);
            });
            return false;
        });
    });
</script>

</body>
</html>
