<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: kai.wang
  Date: 12/4/13
  Time: 4:02 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="head.html" %>
    <title>new post</title>
</head>
<body>
<div class="container">
    <div class="col-lg-10 center">
        <form:form id="form" role="form" method="post" modelAttribute="post" class="form-horizontal"
                   autocomplete="false"
                   data-validator-option="{theme:'simple_right'}">
            <fieldset>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;题目：</span>

                    <div class="col-sm-10">
                        <form:input class="form-control top-space-2" path="title"
                                    data-rule="题目:required;title" placeholder="题目"
                                    value="${post.title}"/>
                    </div>
                </div>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;封面：</span>

                    <div class="col-sm-10">
                        <form:input type="" class="form-control top-space-2" path="coverUrl"
                                    data-rule="封面:required;coverUrl" placeholder="封面"
                                    value="${post.coverUrl}"/>
                    </div>
                </div>
                <div class="form-group top-space-15">
                    <!-- Button -->
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">发布</button>
                    </div>
                </div>
            </fieldset>
        </form:form>
    </div>
</div>
</body>
</html>
