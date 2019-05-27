<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购 - 我的快乐购</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/default.css"/>

    <!-- JS -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script>

    </script>
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
                <span>[<a href="register.jsp">注册</a>]&nbsp;</span>
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
                    <li class="active">
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

<!-- 页面主体部分 -->
<div class="container">
    <!-- 我的快乐购部分 -->
    <div class="form-horizontal">
        <div class="h3 page-header">
            我的快乐购
        </div>
        <c:if test="${mysize eq 0}">
            <!-- 没有订单记录时显示以下内容 -->
            <div class="h1 text-center text-muted">
                没有任何订单记录
            </div>
        </c:if>
        <c:if test="${mysize > 0}">
        <%--@elvariable id="orders" type="java.util.List<com.hr.sm.entity.Order>"--%>
        <c:forEach var="o" items="${orders}" varStatus="i">
            <!-- 有订单记录时显示以下内容(一个order-item就是一个订单项) -->
            <div class="order-item">
                <div class="form-group">
                    <label class="control-label col-xs-3 col-sm-2 col-md-1">订单号</label>
                    <div class="col-xs-9 col-sm-10 col-md-11">
                        <div class="form-control-static">
                            <span class="text-primary">${o.id}</span>
                        </div>
                    </div>

                    <label class="control-label col-xs-3 col-sm-2 col-md-1">收货人</label>
                    <div class="col-xs-9 col-sm-4 col-md-5">
                        <div class="form-control-static">${o.user_name} [<span class="text-primary">${o.tel}</span>]</div>
                    </div>

                    <label class="control-label col-xs-3 col-sm-2 col-md-1">订单状态</label>
                    <div class="col-xs-9 col-sm-4 col-md-5">
                        <div class="form-control-static"><c:if test="${o.status eq 0}">已下单</c:if><c:if test="${o.status eq 1}">运送中</c:if>
                            <c:if test="${o.status eq 2}">等待确认收货</c:if><c:if test="${o.status eq 3}">已确认收货</c:if></div>
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
                            <c:choose>
                                <c:when test="${o.status eq 3}">
                                    <div class="btn-group">
                                        <a href="/order_delete?id=${o.id}" class="btn btn-danger">删除订单</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn-group">
                                        <a href="/order_recive?id=${o.id}" class="btn btn-success">确认收货</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>

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
        </c:if>
    <!-- //我的快乐购部分结束 -->

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