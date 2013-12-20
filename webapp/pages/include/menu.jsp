<%@ page pageEncoding="UTF-8" %>
<nav class="menu">
    <div class="logo">
        <a href="#">
            <img class="img-responsive"
                 src="http://www.inbound.org/assets/inbound/img/logo-fixed-menu.png"></a>
    </div>
    <div class="search-container">
        <div class="search-icon">
            <a href="/" onclick="$('.form-search').submit(); return false;">
                <i class="icon-search"></i>
            </a>
        </div>
        <form class="form-search" action="http://www.inbound.org/articles/all/hot"
              method="get">
            <input type="text" name="query" id="query" class="search-input"
                   data-value="e.g. seo, social, community"
                   value="e.g. seo, social, community" onfocus="searchFocus(this);"
                   onblur="searchBlur(this);">
        </form>
        <div class="clr"></div>
    </div>
    <div class="nav-link-container menu-list">
        <a class="nav-link" href="#" data-toggle="modal">
            <div class="nav-stripe"></div>
            <span class="glyphicon glyphicon-fire"></span>
            <span>最新</span>
            Submit
        </a>
        <a class="nav-link" href="#" data-toggle="modal">
            <div class="nav-stripe"></div>
            <span class="glyphicon glyphicon-fire"></span>
            <span>最新</span>
            Submit
        </a>
        <a class="nav-link" href="#" data-toggle="modal">
            <div class="nav-stripe"></div>
            <span class="glyphicon glyphicon-fire"></span>
            <span>最新</span>
            Submit
        </a>
        <a class="nav-link" href="#" data-toggle="modal">
            <div class="nav-stripe"></div>
            <span class="glyphicon glyphicon-fire"></span>
            <span>最新</span>
            Submit
        </a>
    </div>

    <div class="pull-left menu-tags">
        <a href="#"><span class="label label-primary">Primary</span></a>
        <a href="#"><span class="label label-primary">tags</span></a>
    </div>

</nav>