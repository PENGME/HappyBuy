<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购 - 管理</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/default.css"/>

    <!-- JS -->
    <script src="../js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

    <!--[if lt IE 9]>
    <script src="../js/html5shiv.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/respond.min.js" type="text/javascript" charset="utf-8"></script>
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
            <a href="../index.html" class="navbar-brand">
                <img src="../img/logo.png" alt="Happy Go"/>
            </a>
        </div>
        <div id="navbar-menu1" class="navbar-collapse collapse">
            <div class="navbar-text">
                <span>${user.name}，</span>
                <span>欢迎来到快乐购管理页面！&nbsp;</span>
                <div class="visible-xs"></div>
                <span>[<a href="/logout">注销</a>]&nbsp;</span>
            </div>

            <div class="navbar-right">
                <ul class="navbar-nav nav">
                    <li class="active">
                        <a href="/toBack">管理首页</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">
                            <span>商品</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/ProCateFindAll">类别管理</a>
                            </li>
                            <li>
                                <a href="/ProFindAll">商品管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/toBackOrder">订单</a>
                    </li>
                    <li>
                        <a href="/douser">用户</a>
                    </li>
                    <li>
                        <a href="/news">新闻公告</a>
                    </li>
                    <li>
                        <a href="/ads">广告</a>
                    </li>
                    <li>
                        <a href="../">购物首页</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- //导航条结束 -->

<!-- 页面主体部分 -->
<div class="container">

    <div class="center-block well">

        <h1 class="text-success">欢迎访问快乐购管理页面</h1>

        <div class="row">
            <div class="col-sm-6 col-md-3">
                <h4>
                    <a href="/ProCateFindAll">
                        <span class="glyphicon glyphicon-th-large"></span>
                        <span>商品类别管理</span>
                    </a>
                    <a href="ProCateFindAll?option=add" class="pull-right">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span>新增</span>
                    </a>
                </h4>
                <h4>
                    <a href="/ProFindAll">
                        <span class="glyphicon glyphicon-th-list"></span>
                        <span>商品管理</span>
                    </a>
                    <a href="/ProFindAll?option=add" class="pull-right">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span>新增</span>
                    </a>
                </h4>
                <h4>
                    <a href="/toBackOrder">
                        <span class="glyphicon glyphicon-tags"></span>
                        <span>订单管理</span>
                    </a>
                </h4>
                <h4>
                    <a href="/douser">
                        <span class="glyphicon glyphicon-user"></span>
                        <span>用户管理</span>
                    </a>
                    <a href="/douser?option=add" class="pull-right">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span>新增</span>
                    </a>
                </h4>
                <h4>
                    <a href="/news">
                        <span class="glyphicon glyphicon-globe"></span>
                        <span>新闻管理</span>
                    </a>
                    <a href="/news?option=add" class="pull-right">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span>新增</span>
                    </a>
                </h4>
                <h4>
                    <a href="/ads">
                        <span class="glyphicon glyphicon-bullhorn"></span>
                        <span>广告管理</span>
                    </a>
                    <a href="/ads?option=add" class="pull-right">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span>新增</span>
                    </a>
                </h4>
                <h4>
                    <a href="..//">
                        <span class="glyphicon glyphicon-log-out"></span>
                        <span>返回购物首页</span>
                    </a>
                </h4>
            </div>
        </div>
    </div>

</div>
<!-- //页面主体部分结束 -->

<!-- 页面脚部部分 -->
<footer>
    <hr/>
    <div class="container">
        <div class="row">
            <div class="text-center">
                <div class="col-sm-6 auth">
                    <img src="../img/foot_img3.png" class="img-responsive center-block sm-right" alt="">
                </div>
                <div class="col-sm-6 auth">
                    <img src="../img/foot_img4.png" class="img-responsive center-block sm-left" alt="">
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