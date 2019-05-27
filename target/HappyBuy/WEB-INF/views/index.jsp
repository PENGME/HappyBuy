<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>首页</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/default.css"/>

    <!-- JS -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<!-- 导航条开始 -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="#navbar-menu1" data-toggle="collapse" class="navbar-toggle collapsed">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a href="index.jsp" class="navbar-brand">
                <img src="img/logo.png" alt="Happy Go"/>
            </a>
        </div>
        <div id="navbar-menu1" class="navbar-collapse collapse">
            <div class="navbar-text">
                <span>${user.name}&nbsp;&nbsp;</span>
                <span>欢迎来到快乐购！&nbsp;</span>
                <div class="visible-xs"></div>
                <c:if test="${empty user}">
                    <span>[<a href="/tologin">登录</a>]&nbsp;</span>
                </c:if>
                <span>[<a href="/toregister">注册</a>]&nbsp;</span>
                <c:if test="${not empty user}">
                    <span>[<a href="/logout">注销</a>]&nbsp;</span>
                </c:if>
            </div>

            <div class="navbar-right">
                <ul class="navbar-nav nav">
                    <li class="active">
                        <a href="/">首页</a>
                    </li>
                    <li>
                        <a href="/tomy">个人资料</a>
                    </li>
                    <li>
                        <a href="/mygou?userid=${user.id}">我的快乐购</a>
                    </li>
                    <li>
                        <a href="/cartfindAll" data-flag="link-cart">购物车</a>
                    </li>
                    <c:if test="${user.isMaster eq 1}">
                        <li>
                            <a href="/toBack">后台管理</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- //导航条结束 -->

<!-- 滚动广告部分 -->
<div id="carousel-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-generic" data-slide-to="1"></li>
        <li data-target="#carousel-generic" data-slide-to="2"></li>
        <li data-target="#carousel-generic" data-slide-to="3"></li>
        <li data-target="#carousel-generic" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="img/slides/web-101-101-1.jpg" alt="广告I"/>

        </div>
        <div class="item">
            <img src="img/slides/web-101-101-2.jpg" alt="广告II"/>

        </div>
        <div class="item">
            <img src="img/slides/web-101-101-3.jpg" alt="广告II"/>

        </div>
        <div class="item">
            <img src="img/slides/web-101-101-4.jpg" alt="广告III"/>

        </div>
        <div class="item">
            <img src="img/slides/web-101-101-5.jpg" alt="广告IV"/>

        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- //滚动广告部分结束 -->

<!-- 商品分类部分 -->
<div class="container">
    <div class="row">
        <ul class="breadcrumb">
            <li>
                <a href="/findProduct?cate_id=${1}">全部</a>
            </li>
            <%--@elvariable id="categories" type="java.util.List<com.hr.sm.entity.ProductCategory>"--%>
            <c:forEach items="${categories}" var="c">
                <li class="dropdown">
                    <a href="/findProduct?cate_id=${c.id}" data-toggle="dropdown">
                        <span>${c.name} </span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/findProduct?cate_id=${c.id}">全部</a>
                        </li>
                        <li class="divider"></li>
                        <c:forEach items="${c.categories}" var="g">
                            <li>
                                <a href="/findProduct?cate_id=${g.id}">${g.name}</a>
                            </li>
                        </c:forEach>


                    </ul>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>
<!-- //商品分类部分结束 -->

<!-- 搜索表单部分 -->
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <img src="img/top_center.jpg" class="img-responsive" alt=""/>
        </div>
        <div class="col-sm-4">
            <form action="/findProduct" method="post">
                <div class="form-group form-group-sm">
                    <div class="input-group input-group-sm">
                        <input type="search" class="form-control" name="pname" placeholder="输入商品名称..."/>
                        <div class="input-group-btn">
                            <button class="btn btn-default">
                                <span class="glyphicon glyphicon-search"></span>
                                <span class="sr-only">搜索</span>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- //搜索表单部分结束 -->

<!-- 页面主体部分 -->
<div class="container">

    <div class="row">
        <div class="col-sm-9">
            <h3 class="page-header">
                <span>全场低价商品</span>
                <small>精致好物 更快乐的生活</small>
                <small>
                    <a href="/findProduct?cate_id=${1}">更多...</a>
                </small>
            </h3>

            <!-- 商品列表部分 -->
            <div class="container-fluid">
                <%--@elvariable id="products" type="java.util.List<com.hr.sm.entity.Product>"--%>
                <c:forEach items="${products}" var="p" varStatus="i">
                <c:if test="${i.index%4==0}">
                <div class="row"></c:if>
                    <!-- 商品${i.count} -->
                    <div class="col-sm-3 product-item">
                        <div class="img-thumbnail">
                            <div>
                                <a href="/findByProduct?id=${p.id}">
                                    <img src="img/products/${p.url}" class="img-responsive img-rounded" style="width: 240px;height: 265px;"/>
                                </a>
                            </div>
                        </div>
                        <div class="title">
                            <a href="/findByProduct?id=${p.id}">${p.name}</a>
                        </div>
                        <div class="price">
                            <span>￥</span>
                            <span>${p.price}</span>
                        </div>
                    </div>
                    <c:if test="${i.count%4==0}"></div>
                    </c:if>
         
            </c:forEach>
        </div>
        <!-- //商品列表部分结束 -->

    </div>
    <div class="col-sm-3">
        <h3 class="page-header">
            <span>新闻公告</span>
            <small>
                <a href="news.html">更多...</a>
            </small>
        </h3>
        <div class="container-fluid">
            <ul class="news">
                <li>
                    <a href="news.html">
                        <span class="pull-left">迎双旦，促销大酬宾</span>
                        <span class="pull-right">2010/12/24</span>
                    </a>
                </li>
                <li>
                    <a href="news.html">
                        <span class="pull-left">加入会员，赢千万大礼包</span>
                        <span class="pull-right">2017/12/31</span>
                    </a>
                </li>
                <li>
                    <a href="news.html">
                        <span class="pull-left">免费送</span>
                        <span class="pull-right">2017/12/31</span>
                    </a>
                </li>
                <li>
                    <a href="news.html">
                        <span class="pull-left">迎双旦，促销大酬宾，迎双旦，促销大酬宾</span>
                        <span class="pull-right">2010/12/24</span>
                    </a>
                </li>
                <li>
                    <a href="news.html">
                        <span class="pull-left">加入会员，赢千万大礼包</span>
                        <span class="pull-right">2017/12/31</span>
                    </a>
                </li>
                <li>
                    <a href="news.html">
                        <span class="pull-left">免费送</span>
                        <span class="pull-right">2017/12/31</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

</div>
<!-- //页面主体部分结束 -->

<!-- 页面脚部部分 -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip1.png" class="img-responsive center-block">
                <div class="h4 text-danger">上市企业</div>
                <div class="h5 text-muted">股票代码000001</div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip2.png" class="img-responsive center-block">
                <div class="h4 text-danger">快乐购严选</div>
                <div class="h5 text-muted">正品行货 品质保证</div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip3.png" class="img-responsive center-block">
                <div class="h4 text-danger">10天无理由退货</div>
                <div class="h5 text-muted">为您提供售后无忧保障</div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip4.png" class="img-responsive center-block">
                <div class="h4 text-danger">满129免邮</div>
                <div class="h5 text-muted">在线支付 购物包邮</div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip5.png" class="img-responsive center-block">
                <div class="h4 text-danger">微笑无时无刻</div>
                <div class="h5 text-muted">365*24小时人工服务</div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2 tip-item">
                <img src="img/foot_img_tip6.png" class="img-responsive center-block">
                <div class="h4 text-danger">闪电物流</div>
                <div class="h5 text-muted">闪电发货 次日必达</div>
            </div>
        </div>
    </div>
    <hr/>
    <div class="container">
        <div class="row">
            <div class="col-xs-4 col-sm-2 f-link">
                <a href="#">使用帮助</a>
                <a href="#">税费收取规则</a>
                <a href="#">新手指南</a>
                <a href="#">常见问题</a>
                <a href="#">用户协议</a>
            </div>
            <div class="col-xs-4 col-sm-2 f-link">
                <a href="#">使用帮助</a>
                <a href="#">税费收取规则</a>
                <a href="#">新手指南</a>
                <a href="#">常见问题</a>
                <a href="#">用户协议</a>
            </div>
            <div class="col-xs-4 col-sm-2 f-link">
                <a href="#">使用帮助</a>
                <a href="#">税费收取规则</a>
                <a href="#">新手指南</a>
                <a href="#">常见问题</a>
                <a href="#">用户协议</a>
            </div>
            <div class="col-xs-4 col-sm-2 f-link">
                <a href="#">使用帮助</a>
                <a href="#">税费收取规则</a>
                <a href="#">新手指南</a>
                <a href="#">常见问题</a>
                <a href="#">用户协议</a>
            </div>
            <div class="col-xs-4 col-sm-2 f-link">
                <div>手机快乐购</div>
                <img src="img/footer_ewm_01.png" alt="">
                <div>下载移动客户端</div>
            </div>
            <div class="col-xs-4 col-sm-2 f-link">
                <div>快乐微信购</div>
                <img src="img/footer_ewm_01.png" alt="">
                <div>快乐购官方微信</div>
            </div>
        </div>
        <div class="row">
            <div class="text-center">
                <div class="col-sm-6 auth">
                    <img src="img/foot_img3.png" class="img-responsive center-block sm-right" alt="">
                </div>
                <div class="col-sm-6 auth">
                    <img src="img/foot_img4.png" class="img-responsive center-block sm-left" alt="">
                </div>
                <div class="clearfix"></div>
                <div class="copy">Rights Reserved 免费服务热线: 400-705-1111 | 固话也可拨打: 800-705-1111 E-Mail:
                    service@happygo.com
                </div>
                <div class="copy">湘ICP备12000157号 信息网络传播视听节目许可证号：1810530</div>
            </div>
        </div>
    </div>
</footer>
<!-- //页面脚部部分结束 -->


</body>
</html>