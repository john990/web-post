<%@ page import="com.psy.common.SessionAttribute" %>
<%@ page import="com.psy.common.BeanUtils" %>
<%@ page import="com.psy.bean.User" %>
<div class="container center">
    <ul id="nav" class="nav nav-pills">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="/login">login</a></li>
        <li><a href="/reg">register</a></li>
        <li><a href="/new/post">new post</a></li>
        <%
            Object object = session.getAttribute(SessionAttribute.USER);
            if (object != null && !BeanUtils.isEmptyUser((User)object)) {
                out.print("<li><a href=\"/logout\">logout</a></li>");
            }
        %>
    </ul>
</div>
<script>
    $(function () {
        $('#nav').find('a').each(function () {
            var path = $(this).attr('href');
            if (window.location.pathname.indexOf(path) != -1 && path.length > 0) {
                $(this).parent().addClass('active').siblings().removeClass('active');
            }
        });
    });
</script>