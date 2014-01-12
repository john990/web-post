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
    <title>post</title>
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
        <div class="post-container">
            <div class="post box">
                <div class="infos">
                    <div class="pull-right avatar_large">
                        <a href="/user/${post.userId}"><img alt="1ae4c732f6346be74fa919040c773437" class="uface" src="${post.avatar}" style="width:48px;height:48px;"></a>
                    </div>
                    <h1 class="entry-title">${post.title}</h1>

                    <div class="info leader">
                        <a class="node" href="/tag/${post.tag}">${post.tag}</a>
                        •
                        <a data-author="true" data-name="帝归" href="/user/${post.userId}">${post.username}</a>
                        •
                        于<abbr class="timeago" title="${post.createAt}">${post.createAt}</abbr>发布
                        •
                        最后由
                        <a data-name="zhuangya" href="/zhuangya">zhuangya</a> 于<abbr class="timeago" title="2014-01-05T10:52:43+08:00">1小时前</abbr>回复
                        •
                        ${post.viewCount}次阅读
                    </div>
                </div>
                <div class="body entry-content">
                    ${post.content}
                </div>
                <div class="tools pull-right">
                    <a class="likeable" data-count="0" data-id="16630" data-state="" data-type="Topic" href="#" onclick="return App.likeable(this);" rel="twipsy" data-original-title="喜欢"><i class="icon small_like"></i>
                        <span>喜欢</span></a>
                </div>
                <div class="social-share-button" data-title="OSX 10.9 的默认 Ruby 版本是 2.0，但是 brew server 使用的还是 1.8 via: @ruby_china " data-img="" data-url="">
                    <a class="social-share-button-twitter" data-site="twitter" href="#" onclick="return SocialShareButton.share(this);" rel="nofollow " title="分享到Twitter">twitter</a>
                    <a class="social-share-button-facebook" data-site="facebook" href="#" onclick="return SocialShareButton.share(this);" rel="nofollow " title="分享到Facebook">facebook</a>
                    <a class="social-share-button-google_plus" data-site="google_plus" href="#" onclick="return SocialShareButton.share(this);" rel="nofollow " title="分享到Google+"></a>
                    <a class="social-share-button-weibo" data-site="weibo" href="#" onclick="return SocialShareButton.share(this);" rel="nofollow " title="分享到新浪微博"></a>
                    <a class="social-share-button-douban" data-site="douban" href="#" onclick="return SocialShareButton.share(this);" rel="nofollow " title="分享到豆瓣"></a>
                </div>
            </div>

            <div class="post comments box">
                <div class="total">
                    共收到 <b>${post.commentCount}</b> 条回复
                </div>
                <div class="items">
                    <div class="item" id="reply51">
                        <div class="pull-left face"><a href="/luikore"><img alt="2880" class="uface" src="http://l.ruby-china.org/user/large_avatar/2880.png" style="width:48px;height:48px;"></a></div>
                        <div class="content">
                            <div class="info">
                        <span class="name">
                          <a data-name="Zete" href="/luikore">luikore</a>
                        </span>
                        <span class="time">
                          <a class="reply-floor" href="#reply51">51楼</a>
                          ,
                          <abbr class="timeago" title="2014-01-04T17:17:08+08:00">1天前</abbr>
                        </span>
                        <span class="opts pull-right">
                            <a class="likeable" data-count="0" data-id="175985" data-state="" data-type="Reply" href="#" onclick="return App.likeable(this);" rel="twipsy" data-original-title="喜欢"><i class="icon small_like"></i> <span>喜欢</span></a>
                            <a class="edit icon small_edit" data-uid="2880" href="/topics/16601/replies/175985/edit" title="修改回帖"></a>
                            <a class="icon small_reply" data-floor="51" data-login="luikore" href="#" title="回复此楼"></a>
                        </span>
                            </div>
                            <div class="body">
                                <p>
                                    <a href="#reply39" class="at_floor" data-floor="39">#39楼</a>
                                    <a href="/shiny" class="at_user" title="@shiny"><i>@</i>shiny</a>
                                    是不重要, 但那是最低要求啊. 难道画家个个都是不需要技法不懂颜料一步就能登天的么...
                                </p>
                            </div>
                      <span class="opts">
                      </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="box reply">
                <label class="control-label">发表评论</label>
                <div class="textarea controls">
                    <textarea type="" class="form-control" rows="5" placeholder="说点什么吧"></textarea>
                    <button type="submit" class="btn btn-primary send">提交回复</button>
                </div>
            </div>
        </div>

        <div class="slide box">
            aaaa
        </div>
    </div>
</body>
</html>