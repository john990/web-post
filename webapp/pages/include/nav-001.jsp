<%@ page pageEncoding="UTF-8" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-inner">
         <div class="container">
            <h3>
                <a href="/" class="site-logo">
                </a>
            </h3>
            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath}/">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/post/">文章</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/new/post/">发表</a>
                </li>
                <li>
                    <a href="/manage/posts/">管理</a>
                </li>
            </ul>
            <form action="/search" class="navbar-search pull-left" method="get">
                <input type="text" name="q" class="search-query span3" value=""
                       placeholder="搜索">
            </form>
            <ul class="nav pull-right" id="userbar">
                <li class="first">
                    <a href="/login">注册</a>
                </li>
                <li class="last">
                    <a href="/reg">登录</a>
                </li>
            </ul>
         </div>
    </div>
</nav>