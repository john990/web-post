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
    <script type="text/javascript" src="/resources/js/page/new-post.js"></script>
    <title>new post</title>
</head>
<body>
<div class="container">
    <div class="col-lg-10 center">
    <!-- 文章表單 -->
    <form:form id="form" role="form"  method="post"
               modelAttribute="post" cssClass="hide1" autocomplete="false">
        <form:hidden id="title" class="form-control top-space-2" path="title" name="title" data-rule="题目:required;title" value="${post.title}"/>
        <form:hidden id="cover-url" path="coverUrl" value="${post.coverUrl}"/>
    </form:form>

        <div class="form-horizontal" data-validator-option="{theme:'simple_right'}">
            <fieldset>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;题目：</span>

                    <div class="col-sm-10">
                        <input id="title-show" class="form-control top-space-2" path="title" name="title" data-rule="题目:required;title" placeholder="题目"/>
                    </div>
                </div>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;封面：</span>

                    <div class="col-sm-10">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <!-- 七牛表單 -->
                             <form:form id="file-form" method="post" action="http://up.qiniu.com/" enctype="multipart/form-data" >
                                <span class="btn btn-default btn-file">
                                    <span class="fileinput-new">Select image</span>
                                    <span class="fileinput-exists">Change</span>
                                    <input id="cover-file" multiple="multiple" size="3" name="file" type="file" class="form-control top-space-2 filePrew"/>
                                    <input id="token" name="token" type="hidden"/>
                                </span>
                                <span id="file-name" class="fileinput-filename">
                                     file-name
                                </span>
                                <span id="cover-process" class=""></span>
                             </form:form>
                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;内容：</span>
                    <div class="col-sm-10">
                        <textarea name="content"></textarea>
                    </div>
                </div>
                <div class="form-group top-space-15">
                    <!-- Button -->
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="submit" type="button" class="btn btn-primary">发布</button>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript">
    // tinymce初始化
    tinymce.init({
        selector: "textarea",
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu autoresize"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        language : 'zh_CN',
        menubar: false,
        width: '99%' ,
        autoresize_min_height: '400',
        autoresize_max_height: '1500'
    });
</script>
</body>
</html>
