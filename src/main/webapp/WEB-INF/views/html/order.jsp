<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购 - 订单管理</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/default.css"/>

    <!-- JS -->
    <script src="../js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/default.js" type="text/javascript" charset="utf-8"></script>

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
                    <li>
                        <a href="/toBack">管理首页</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">
                            <span>商品</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="product-category.html">类别管理</a>
                            </li>
                            <li>
                                <a href="product.html">商品管理</a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="order.html">订单</a>
                    </li>
                    <li>
                        <a href="user.html">用户</a>
                    </li>
                    <li>
                        <a href="news.html">新闻</a>
                    </li>
                    <li>
                        <a href="ads.html">广告</a>
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
    <div class="h3 page-header">
        <span>订单管理</span>
    </div>

    <div class="form-horizontal">


        <%--@elvariable id="orders" type="java.util.List<com.hr.sm.entity.Order>"--%>
        <c:forEach items="${pageInfo.list}" var="o" varStatus="i">
        <div class="order-item">
            <div class="form-group">
                <label class="control-label col-xs-3 col-sm-2 col-md-1">订单号</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static">
                        <span class="text-primary">${o.id}</span>
                    </div>
                </div>

                <label class="control-label col-xs-3 col-sm-2 col-md-1">下单用户</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static">
                        <span class="text-primary">${o.user_name}</span>
                    </div>
                </div>

                <label class="control-label col-xs-3 col-sm-2 col-md-1">收货人</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static">${o.user_name} [<span class="text-primary">${o.tel}</span>]</div>
                </div>

                <label class="control-label col-xs-3 col-sm-2 col-md-1">订单状态</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static"><c:if test="${o.status eq 0}">已下单</c:if><c:if test="${o.status eq 1}">运送中</c:if>
                        <c:if test="${o.status eq 2}">等待确认收货</c:if><c:if test="${o.status eq 3}">已确认收货</c:if> </div>
                </div>

                <label class="control-label col-xs-3 col-sm-2 col-md-1">订单金额</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static">￥${o.total_amount}</div>
                </div>

                <fmt:formatDate value="${o.creation_time}" var="ctime" pattern="yyyy-MM-dd hh:mm:ss"/>
                <label class="control-label col-xs-3 col-sm-2 col-md-1">订单时间</label>
                <div class="col-xs-9 col-sm-4 col-md-5">
                    <div class="form-control-static">${ctime}</div>
                </div>

                <label class="control-label col-xs-3 col-sm-2 col-md-1">收货地址</label>
                <div class="col-xs-9 col-sm-5 col-md-5">
                    <div class="form-control-static">${o.address}</div>
                </div>

                <div class="col-xs-12 col-sm-4">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <a href="#order-detail-${i.count}" data-toggle="collapse" class="btn btn-default">查看订单明细</a>
                        </div>
                        <div class="btn-group dropdown">
                            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span>订单状态</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/ChaStatus?status=${0}&id=${o.id}">已下单</a>
                                </li>
                                <li>
                                    <a href="/ChaStatus?status=${1}&id=${o.id}">运送中</a>
                                </li>
                                <li>
                                    <a href="/ChaStatus?status=${2}&id=${o.id}">等待确认收货</a>
                                </li>
                                <li>
                                    <a href="/ChaStatus?status=${3}&id=${o.id}">已确认收货</a>
                                </li>

                            </ul>
                        </div>
                        <div class="btn-group">
                            <a href="/order_delete?id=${o.id}" data-del="" class="btn btn-danger">删除订单</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 明细 -->

            <div id="order-detail-${i.count}" class="collapse collapsed">
                <div class="order-detail">
                    <c:forEach items="${o.details}" var="d">
                        <div>
                            <span class="text-muted">${d.product_name} </span>
                            <span class="text-primary">&nbsp;x${d.product_count}</span>
                            <span class="text-danger">&nbsp;￥${d.product_price*d.product_count}</span>
                        </div>

                    </c:forEach>

                </div>
            </div>
        </div>
        </c:forEach>

    </div>
    <div class="container">
        <div style="float: left">
        <span>第${pageInfo.pageNum}/${pageInfo.pages}页，共${pageInfo.total}条数据，每页显示${pageInfo.pageSize}条，当前显示第${pageInfo.startRow}-${pageInfo.endRow}条。</span>
        </div>
        <div style="margin-top: -25px">
        <ul class="pagination pagination-sm">
            <li class="page-item" ${pageInfo.hasPreviousPage?'':'data-dis'}>
                <a href="/toBackOrder?pageNum=${pageInfo.prePage}" class="page-item page-link">&lt;</a>
            </li>
            <c:forEach var="i" items="${pageInfo.navigatepageNums}">
                <li class="page-item ${i eq pageInfo.pageNum?'active':''}">
                    <a href="/toBackOrder?pageNum=${i}" class="page-item page-link">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item" ${pageInfo.hasNextPage?'':'data-dis'}>
                <a  href="/toBackOrder?pageNum=${pageInfo.nextPage}" class="page-item page-link">&gt;</a>
            </li>
        </ul>
        <script type="text/javascript">
            $(document).on('click','li[data-dis]',function () {
                event.preventDefault();
            });
        </script>
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