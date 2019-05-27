<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

	<head>
		<meta charset="utf-8" />
		<title>快乐购 - 购物车</title>

		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="css/normalize.min.css" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />

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
				<a href="/" class="navbar-brand">
					<img src="img/logo.png" alt="Happy Go" />
				</a>
			</div>
			<div id="navbar-menu1" class="navbar-collapse collapse">
				<div class="navbar-text">
					<span>${user.name}</span>
					<span>欢迎来到快乐购！&nbsp;</span>
					<div class="visible-xs"></div>
					<c:if test="${empty  user}" >
						<span>[<a href="/tologin">登录</a>]&nbsp;</span>
					</c:if>
					<span>[<a href="/toregister">注册</a>]&nbsp;</span>
					<c:if test="${not empty  user}">
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
						<li class="active">
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

			<c:if test="${count eq 0}">
			<!-- 空购物车部分（购物车为空时显示） -->
			<div class="row">
				<div class="col-sm-3 col-sm-offset-2">
					<div class="text-center">
						<img src="img/car_no_goods.jpg" class="img-responsive center-block" />
					</div>
				</div>
				<div class="col-sm-5">
					<div class="text-center cart-empty">
						<p class="text-muted">亲，您的购物车空空如也，快去抢购心仪的商品吧~~~</p>
						<a href="/" class="btn btn-info">去快乐购</a>
					</div>
				</div>
			</div>
			<!-- //空购物车部分结束 -->
			</c:if>

			<c:if test="${count>0}">
			<!-- 购物车列表部分（购物车有数据时显示） -->
			<form id="form-cart" action="/toorder-confirm" class="form-horizontal" method="post">
				<table class="table table-hover table-striped table-condensed">
					<thead class="bg-primary">
						<tr>
							<th>
								<input name="parentCheckbox" type="checkbox" />
							</th>
							<th>商品名称</th>
							<th>单价(元)</th>
							<th>数量</th>
							<th>小计金额(元)</th>
							<th>编辑</th>
						</tr>
					</thead>
					<tbody>
					<%--@elvariable id="carts" type="java.util.List<com.hr.sm.entity.Cart>"--%>
					<c:forEach items="${carts}" var="c">
						<tr>
							<td width="30">
								<input id="chk1" name="subCheckbox" type="checkbox" value="${c.id}"/>
								<input type="hidden" value="${c.product.price*c.count}" />
							</td>
							<td>
								<label for="chk1" class="text-muted">${c.product.name}</label>
							</td>
							<td>
								<label for="chk1">${c.product.price}</label>
							</td>
							<td>
								<label for="chk1">${c.count}</label>
							</td>
							<td>
								<label for="chk1">${c.product.price*c.count}</label>
							</td>
							<td width="70">
								<button data-del="100" type="button" class="btn btn-xs btn-danger">
									<span class="glyphicon glyphicon-remove"></span>
									<span href="/cartDelete?id=${c.id}" class="hidden-xs" style="color: white">移除</span>
								</button>
							</td>
						</tr>
					</c:forEach>

					</tbody>

					<tfoot>
						<tr>
							<td colspan="4" align="right">
								<div class="cart-foot-sum text-muted">
									<small>总计金额：</small>
									</h3>
								</div>
							</td>
							<td colspan="2" align="left">
								<div class="cart-foot-sum text-danger">￥${sum}</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="right">
								<div class="cart-foot-sum text-muted">
									<small>应付款：</small>
								</div>
							</td>
							<td colspan="2" align="left">
								<div class="cart-foot-sum text-danger" id="sum">￥0.00</div>
							</td>
						</tr>
						<tr>
							<td colspan="6" align="right">
								<c:if test="${user eq null}">
								<!--没有登录时不可以提交订单，显示该链接-->
								<a href="/" class="btn btn-lg btn-warning">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<span>请登录后再提交订单</span>
								</a>
								</c:if>

								<!--已登录时可以提交订单，显示该按钮-->
								<button class="btn btn-lg btn-success" disabled="disabled">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<span>提交订单</span>
								</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
			<!-- //购物车列表部分结束 -->
			</div>
			<!-- //页面主体部分结束 -->
		</c:if>

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
							<div class="copy">Rights Reserved 免费服务热线: 400-705-1111 | 固话也可拨打: 800-705-1111 E-Mail: service@happygo.com</div>
							<div class="copy">湘ICP备12000157号 信息网络传播视听节目许可证号：1810530</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- //页面脚部部分结束 -->
	</body>

</html>