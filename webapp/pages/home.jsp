<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<c:set var="pageContext" value="${pageContext}"/>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <%@include file="include/head.meta.html" %>
    <%@include file="include/base.css.js.html" %>
    <link rel="stylesheet" href="/resources/css/menu.css">
    <link rel="stylesheet" href="/resources/css/home.css">
    <title>home</title>
</head>
<body>
    <%@include file="include/menu.jsp" %>
    <div class="content-wrap">
        <div class="main-container">
            <div class="main">
                <c:if test="${not empty posts}">
                    <ol class="articles">
                        <c:forEach var="p" items="${posts}">
                            <li class="article">
                            <div class="poster-avatar">
                                <a href="#">
                                    <img src="/resources/images/head.jpeg" class="img-responsive" onerror="defaultAvatar(this);"/>
                                </a>
                            </div>
                            <div class="article-info">
                                <div class="title">
                                    <a href="#"><span>这里能看大家跑了多少分，目前最多的跑了4000w分。。。</span></a>
                                </div>
                                <div class="minor">
                                    <span class="tag">
                                         <span><strong><a href="#">标签</a></strong></span>
                                    </span>
                                    <span class="posted-by">
                                        &nbsp;•&nbsp; <a href="#"><span>不靠谱啊</span></a>
                                    </span>
                                    <span class="posted-time">
                                        &nbsp;•&nbsp; </i><span>26 分钟前</span>
                                    </span>

                                </div>
                            </div>
                            <div class="count">
                               <span class="badge">20</span>
                            </div>
                        </li>
                        </c:forEach>
                    </ol>
                </c:if>
            </div>
        </div>
        <div class="slider">slider</div>
    </div>
</body>
</html>