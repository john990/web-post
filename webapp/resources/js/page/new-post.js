/**
 * Created by kai.wang on 12/12/13.
 */
$(function () {
    load();
    changeListener();
    $("#cover-file").change(function () {
        var file = document.getElementById("cover-file").files[0];
        $("#file-name").html(file.name);
        getToken();
    });
    /** 获取七牛TOKEN */
    function getToken() {
        $.ajax({
            type: 'POST',
            url: "/upload-token",
            success: function (token) {
                $('#token').val(token);
                qiniu_upload();
            },
            dataType: "text"
        });
    }

    // 七牛上传
    function qiniu_upload() {
        $("#file-form").ajaxSubmit({
            uploadProgress: function (event, position, total, percentComplete) {
//                    alert(position);
                $('#cover-process').removeClass().addClass('text-primary').html(percentComplete + "%");
            },
            success: function (data) {
//                    alert("hash:"+data.hash+",key:"+data.key);
                // 上传显示
                $('#cover-process').removeClass().addClass('text-success').html('上传成功');
                // 设置封面的值
                $('#cover-url').val(data.key);
            },
            error: function (xhr) {
                alert(xhr + "error");
            }
        });
    }

    $("#submit").click(function () {
        $("#form").submit();
    });


    // 表单赋值监听
    function changeListener() {
        // title
        $('#title-show').change(function () {
            $('#title').val($('#title-show').val());
        });
    }

    // 加载默认值
    function load() {
        $('#title-show').val($('#title').val());
        $('#content-show').html($('#content').val());
    }

});