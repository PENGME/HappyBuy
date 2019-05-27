<%--@elvariable id="product" type="com.hr.sm.entity.Product"--%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购-商品详情</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/default.css"/>

    <!-- JS -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cart.min.js" type="text/javascript" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/respond.min.js" type="text/javascript" charset="utf-8"></script>
    <![endif]-->
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
                    <input type="hidden" id="fou" value="abc">
                    <span>[<a href="/tologin">登录</a>]&nbsp;</span>
                </c:if>
                <span>[<a href="/toregister">注册</a>]&nbsp;</span>
                <c:if test="${not empty user}">
                    <span>[<a href="/logout">注销</a>]&nbsp;</span>
                </c:if>
            </div>

            <div class="navbar-right">
                <ul class="navbar-nav nav">
                    <li>
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
                    <a href="products.jsp" data-toggle="dropdown">
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



<!-- 页面主体部分 -->
<div class="container">

    <!-- 商品信息部分 -->
    <div class="row">
        <div class="col-sm-5">
            <img src="img/products/${product.url}" class="img-thumbnail img-responsive"/>
        </div>
        <div class="col-sm-7">
            <div class="product-detail">
                <div class="h3">${product.name}</div>
                <div class="h3 line">
                    <span class="text-danger">￥</span>
                    <span class="text-danger">${product.price}</span>
                    <small>编号:XH00001</small>
                </div>
                <div class="h3 line">运费：包邮</div>
                <div class="h3 line">库存：${product.stock}</div>
                <div class="h3">
                    <span>数量：</span>
                    <input name="count" type="number" form="form-shop" value="1" max="100" class="form-control count"
                           required="required"/>
                </div>
                <form id="form-shop" action="/tocart">
                    <input type="hidden" id="pid" name="pid" value="${product.id}">
                    <button class="btn btn-lg btn-default">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span>立即购买</span>
                    </button>
                    <button class="btn btn-lg btn-primary" data-toggle="add-cart">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span>加入购物车</span>
                    </button>
                </form>
                <script type="text/javascript">

                </script>
            </div>
        </div>
    </div>
    <!-- //商品信息部分结束 -->
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