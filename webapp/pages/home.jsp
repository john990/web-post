<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front.css">
    <title>home</title>
</head>
<body>
    <%@include file="include/nav-001.jsp" %>
    <div class="container main">
        <div class="bread-nav">
            <ol class="breadcrumb">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Library</a></li>
                  <li class="active">Data</li>
            </ol>
        </div>

        <div class="home_suggest_topics box">
            <h2>精华文章</h2>
            <div class="topics">
                <c:if test="${not empty posts}">
                    <c:forEach var="p" items="${posts}">
                        <div class="topic topic_line">
                            <div class="pull-left avatar">
                                <a href="#">
                                    <img alt="153" class="uface"
                                         src="http://l.ruby-china.org/user/large_avatar/153.jpg"
                                         style="width:48px;height:48px;">
                                </a>
                            </div>
                            <div class="right_info">
                                <div class="pull-right replies">
                                    <a class="badge" href="#">6</a>
                                </div>
                                <div class="infos">
                                    <div class="title">
                                        <a href="/post/${p.id}" title="SEO 相关">${p.title}</a>
                                        <i class="icon small_cert_on" title="精华贴"></i>
                                    </div>
                                    <div class="info">
                                        <a class="node" href="#">${p.tag}</a>
                                        •由
                                        <a data-name="杉杉"
                                           href="/user/${p.username}">${p.username}</a>
                                        <em>
                                            • 创建于
                                            <abbr class="timeago" title="${p.time}">${p.time}</abbr>
                                        </em>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="more">
                <a href="/topics/excellent">查看更多精华贴...</a>
            </div>
        </div>
    </div>
</body>
</html>