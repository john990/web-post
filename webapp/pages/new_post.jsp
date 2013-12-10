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


        <form:form id="form" role="form" method="post"
                   modelAttribute="post" class="form-horizontal" autocomplete="false"
                   data-validator-option="{theme:'simple_right'}">
            <fieldset>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;题目：</span>

                    <div class="col-sm-10">
                        <form:input class="form-control top-space-2"
                                    path="title"
                                    name="title"
                                    data-rule="题目:required;title"
                                    placeholder="题目"
                                    value="${post.title}"/>
                    </div>
                </div>
                <div class="form-group">
                    <!-- Text input-->
                    <span class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;封面：</span>

                    <div class="col-sm-10">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div>
                                <form:input id="cover-url" class="hide"
                                            path="coverUrl"
                                            value="${post.coverUrl}"/>
                                <form id="file-form" method="post" action="http://up.qiniu.com/"
                                      enctype="multipart/form-data">
                                    <span class="btn btn-default btn-file">
                                        <span class="fileinput-new">Select image</span>
                                        <span class="fileinput-exists">Change</span>
                                            <input id="cover-file" multiple="multiple" size="3"
                                                   name="file"
                                                   type="file"
                                                   class="form-control top-space-2 filePrew"/>
                                    </span>
                                    <span id="file-name"
                                          class="fileinput-filename ">file-name</span>
                                    <%--<input name="key" type="hidden" value="<resource key>">--%>
                                    <%--<input name="x:<custom_field_name>" type="hidden"
                                           value="<custom value>">--%>
                                    <input id="token" name="token" type="hidden" value="<token>">
                                </form>
                                <span id="process"></span>
                            </div>
                        </div>

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
<script type="text/javascript">
    $(function () {
        var file;
        $("#cover-file").change(function () {
            file = document.getElementById("cover-file").files[0];
            $("#file-name").html(file.name + ",size:" + file.size);
            $("#cover-url").val(file.name);
            getToken();
        });

        /** 获取七牛TOKEN */
        function getToken() {
            $.ajax({
                type: 'POST',
                url: "/upload-token",
                success: function (token) {
                    $('#token').val(token);
                    qniu_upload();
                },
                dataType: "text"
            });
        }

        function qniu_upload(){
//            $('#file-form').submit();
            $.ajax({
                type: 'POST',
                data: $('#file-form').serialize(),
                async: false,
                url: "http://up.qiniu.com/",
                success: function (token) {
                    qniu_upload();
                },
                error:function(str){
                    alert(str);
                },
                dataType: "text"
            });
        }

    });
</script>
</body>
</html>
