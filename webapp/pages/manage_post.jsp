<%--
  Created by IntelliJ IDEA.
  User: kai.wang
  Date: 12/13/13
  Time: 6:18 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <link rel="stylesheet" href="/resources/css/manage.css">
    <script type="text/javascript" src="/resources/js/jquery.pagination.js"></script>
    <title>manage post</title>
</head>
<body>
    <%@include file="include/nav.jsp" %>
    <div class="container">
        <div class="table-responsive container col-sm-10">
            <table id="posts-table" class="table table-bordered table-hover table-condensed">
              <thead>
                <tr>
                  <th class="text-center">No.</th>
                  <th class="text-center">选择</th>
                  <th>标题</th>
                  <th>封面</th>
                  <th>内容片段</th>
                  <th>作者</th>
                  <th>创建时间</th>
                  <th>状态</th>
                  <th>编辑</th>
                </tr>
              </thead>
              <tbody>
                <tr class="hide">
                  <td>0</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
        </div>
        <div class="container">
            <span id="msg" class="text-primary"></span>
        </div>
        <div class="container">
            <button id="audit-success" type="button" class="btn btn-success">审核通过</button>
            <button id="audit-fail" type="button" class="btn btn-warning">驳回</button>
            <button id="audit-delete" type="button" class="btn btn-danger">删除</button>
        </div>
        <div id="pagination" class="container">
        </div>
    </div>

<script type="application/javascript">
    /** 未审核 */
    var POST_STATUS_NOT_AUDIT = 0;
    /** 正常 */
    var POST_STATUS_NORMAL = 1;
    /** 审核驳回 */
    var POST_STATUS_AUDIT_REJECT = 2;
    /** 已删除 */
    var POST_STATUS_DELETE = 9;
    /** 每页显示的条数 */
    var MANAGE_POST_PER_PAGE = 10;

    $(function(){
        loadCount(POST_STATUS_NOT_AUDIT);

        // 审核通过
        $('#audit-success').click(function(){
            putStatus(POST_STATUS_NORMAL);
        });
        // 审核失败
        $('#audit-fail').click(function(){
            putStatus(POST_STATUS_AUDIT_REJECT);
        });
        // 删除
        $('#audit-delete').click(function(){
            putStatus(POST_STATUS_DELETE);
        });
    });

    // 加载文章数
    function loadCount(status){
        $.ajax({
            type: 'GET',
            url: "/manage/posts/count/"+status,
            success: function (count) {
                paging(count,0);
            },
            dataType: "json"
        });
    }

    // 加载文章
    function loadPosts(page){
        $.ajax({
            type: 'GET',
            url: "/manage/posts/"+page,
            success: function (posts) {
                packagePost(page,posts);
            },
            dataType: "json"
        });
    }

    // 修改文章状态
    function putStatus(status){
        $('#msg').html('修改中...');
        var ids = getCheckedId();
        $.ajax({
            type: 'POST',
            url: "/manage/posts/edit/status/",
            data: { status:status,ids:ids },
            success: function (data) {
                $('#msg').html('修改成功').hide('normal');
            },
            error: function (data) {
                $('#msg').html('修改失败请重试').hide('normal');
            },
            dataType: "text"
        });
    }

    // 组装post
    function packagePost(page,posts){
        $("#posts-table").find("tr:gt(0)").remove();
        for(var i=0;i<posts.length;i++){
            var post = posts[i];
            var tds = '';
            var tr = '';
            var num = i + 1 + (page - 1) * MANAGE_POST_PER_PAGE;
            var checkBox = '<label style="width: 100%;">&nbsp;<input type="checkbox" value="'+post.id+'">&nbsp;</label>';
            tds += addToTd(num + '<span class="hide" id="post-id">'+post.id+'</span>','text-center');
            tds += addToTd(checkBox,'text-center');
            tds += addToTd(post.title,'');
            tds += addToTd(addToA(post.cover,'','','点击查看'),'');
            tds += addToTd(post.intro,'manage-post-content');
            tds += addToTd(post.userName,'');
            tds += addToTd(post.createAt,'');
            tds += addToTd(intToPostStatusSpan(post.status),'');
            tds += addToTd("edit",'');
            tr = addToTr(tds,'');
            $("#posts-table > tbody:last").append(tr);
        }
    }

    // 分页算法
    function paging(count,index){
        $('#pagination').pagination(count, {
            current_page : index,
            items_per_page : MANAGE_POST_PER_PAGE,
            num_display_entries : 8,
            callback : function(page_index){
                loadPosts(page_index+1);
            },
            load_first_page : true,
            prev_text : '&laquo;&nbsp;上一页',
            next_text : '下一页&nbsp;&raquo;',
            ul_class:'pagination pagination-sm'
        });
    }

    function getCheckedId() {
        var arr = [];
        var i = 0;
        $('#posts-table').find(':checked').each(function () {
            arr[i] = $(this).attr("value");
            i++;
        });
        return arr;
    }


</script>
</body>
</html>
