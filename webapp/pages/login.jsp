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
    <%@include file="head.html" %>
    <title>login</title>
</head>
<body>
<div id="login-container" class="container">
    <div class="col-lg-4 center">
        <p id="formsContent"></p>

        <p>${success}</p>

        <p style="color: red;">${message}</p>
        <form:form id="form" role="form" method="post" modelAttribute="user" class="form-horizontal"
                   autocomplete="false"
                   data-validator-option="{theme:'simple_right'}">
            <fieldset>
                <div class="control-group">
                    <!-- Text input-->
                    <span class="control-label" for="input01">&nbsp;&nbsp;&nbsp;邮箱</span>

                    <div class="controls">
                        <form:input class="form-control top-space-2" path="email"
                                    data-rule="邮箱:required;username" placeholder="邮箱"
                                    value="${user.email}" />
                    </div>
                </div>
                <div class="control-group top-space-10">
                    <!-- Text input-->
                    <span class="control-label" for="input01">&nbsp;&nbsp;&nbsp;密码</span>

                    <div class="controls">
                        <form:password class="form-control top-space-2" path="password"
                                       data-rule="密码:required;password" placeholder="密码"
                                       value="" />
                    </div>
                </div>
                <div id="error-wrap" class="control-group top-space-10">
                    <span id="error-data" class="hide">${error}</span>

                    <p id="error" class="text-danger left-space-15"></p>
                </div>
                <div class="control-group top-space-15">
                    <label class="control-label"></label>
                    <!-- Button -->
                    <div class="controls">
                        <button type="submit" class="btn btn-primary">登陆</button>
                    </div>
                </div>
            </fieldset>
        </form:form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        keepLoginCenter();
        showError();
    });
    $(window).resize(function () {
        keepLoginCenter();
    });

    /** 保持login居中 */
    function keepLoginCenter() {
        var window_height = $(document).height();
        var login_height = $("#login-container").height();
        $("#login-container").css("margin-top", (window_height - login_height - 80) / 2 + "px");
    }

    /** 显示错误信息 */
    function showError() {
        var json = JSON.parse($('#error-data').html());
        if (typeof (json) != 'undefined') {
            var error_str = '';
            var i = 0;
            for (var key in json) {
                if (i == 0) {
                    error_str += json[key];
                } else {
                    error_str += "<br/>" + json[key];
                }
                i++;
            }
            $('#error').html(error_str);
        }
    }
</script>
</body>
</html>
