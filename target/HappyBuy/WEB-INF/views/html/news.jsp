<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>快乐购 - 新闻公告管理</title>

		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/normalize.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/default.css" />

		<!-- JS -->
		<script src="../js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/default.js" type="text/javascript" charset="utf-8"></script>

		<!--[if lt IE 9]>
			<script src="../js/html5shiv.min.js" type="text/javascript" charset="utf-8"></script>
			<script src="../js/respond.min.js" type="text/javascript" charset="utf-8"></script>
		<![endif]-->


		<script type="text/javascript">
			<%--详情--%>
			function loadPage(id){
				$('#modal-show-news').modal('show');
				var url = "/findbyIdxq?id="+id;
				$('#modal-show-news .modal-content').load(url);
			}
			<%--修改--%>
			function loadBj(id){
				$('#modal-edit-news').modal('show');
				var url ="/findbyId?id="+id;
				$('#modal-edit-news .modal-content').load(url);
			}
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
					<a href="/toqianindex" class="navbar-brand">
						<img src="../img/logo.png" alt="Happy Go" />
					</a>
				</div>
				<div id="navbar-menu1" class="navbar-collapse collapse">
					<div class="navbar-text">
						<span>${user.name}&nbsp;&nbsp;</span>
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
										<a href="/productcategory">类别管理</a>
									</li>
									<li>
										<a href="/product">商品管理</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="/order">订单</a>
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
			<div class="h3 page-header">
				<span>新闻公告管理</span>

				<small class="pull-right">
					<a href="#modal-add-news" class="btn btn-xs btn-primary" data-toggle="modal">新增新闻公告</a>
				</small>
			</div>

			<table class="table table-hover table-striped">
				<thead class="bg-primary">
					<th>标题</th>
					<th>时间</th>
					<th>操作</th>
				</thead>

				<tbody>
				<%--@elvariable id="news" type="java.util.List<com.hr.sm.entity.News>"--%>
				<c:forEach items="${news}" var="n" varStatus="i">
					<tr>
						<td>${n.title}</td>
						<fmt:formatDate value="${n.creation_time}" var="creation_time" pattern="yyyy-MM-dd"/>
						<td>${creation_time}</td>
						<td>
							<a href="" class="btn btn-xs btn-default" data-toggle="modal" onclick="loadPage('${n.id}')" >详细</a>
							<a href="" class="btn btn-xs btn-default" data-toggle="modal" onclick="loadBj('${n.id}')">编辑</a>
							<a href="/newsdelete?id=${n.id}" data-del="" class="btn btn-xs btn-danger">删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>

			</table>
		</div>

		<!-- 查看新闻公告模态框部分 详情-->
		<div id="modal-show-news" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">

				</div>
			</div>
		</div>
		<!-- //查看新闻公告模态框部分结束 -->

		<!-- 添加新闻公告模态框部分 -->
		<div id="modal-add-news" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-plus"></span>
							<span>新增新闻公告</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-add-news" action="/newsadd" class="form-horizontal" method="post">
							<div class="form-group">
								<label class="control-label col-sm-2">标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" required="required" name="title"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">内容</label>
								<div class="col-sm-10">
									<textarea rows="5" class="form-control" required="required" name="content"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" type="submit" form="form-add-news">新增新闻公告</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //添加新闻公告模态框部分结束 -->

		<!-- 编辑新闻公告模态框部分 -->
		<div id="modal-edit-news" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">

				</div>
			</div>
		</div>
		<!-- //编辑新闻公告模态框部分结束 -->

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
						<div class="copy">Rights Reserved 免费服务热线: 400-705-1111 | 固话也可拨打: 800-705-1111 E-Mail: service@happygo.com</div>
						<div class="copy">湘ICP备12000157号 信息网络传播视听节目许可证号：1810530</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- //页面脚部部分结束 -->

	</body>

</html>