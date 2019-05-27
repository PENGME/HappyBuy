<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>快乐购 - 广告管理</title>

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
		<script src="../js/ads.min.js" type="text/javascript" charset="utf-8"></script>

		<!--[if lt IE 9]>
			<script src="../js/html5shiv.min.js" type="text/javascript" charset="utf-8"></script>
			<script src="../js/respond.min.js" type="text/javascript" charset="utf-8"></script>
		<![endif]-->
		<!--JQuery框架的颜色处理支持-->
		<script src="js/jquery.color-2.1.2.js" type="text/javascript"></script>

		<script type="text/javascript">
			$(function () {
				$('#pic').on('input', function () {
					var file = this.files[0];
					var url = '/upimg';

					//创建一个表单数据对象
					var formData = new FormData();
					//formData.append("login", "admin");
					formData.append("pic", file); //向表单数据对象中添加一个文件，准备上传

					$.ajax({
						url: url,
						type: "POST",
						data: formData, //要提交的包含上传文件的表单数据对象
						processData: false, //不在再处理表单了
						contentType: false, //不设置请求类型
						success: function (name) { //服务器处理完成之后的回调函数
							$('#img-pic').attr('src', '/img/slides/' + name);
							$('#user-photo').val(name);
						}
					});

					/*$.post(url, {}, function (name) {
                                //name参数的值就是服务器返回的保存完成后的文件的新名称
                                console.log('文件上传完成，服务器返回的新文件名称：')
                                console.log(name)
                            });*/

				});
			});
		</script>

		<script type="text/javascript">
			function loadBj(id){
				$('#modal-edit-ads').modal('show');
				var url ="/findbyIdads?id="+id;
				$('#modal-edit-ads .modal-content').load(url);
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
						<span>${user.name}</span>
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
				<span>广告管理</span>
				<small class="pull-right">
					<a href="#modal-add-ads" class="btn btn-xs btn-primary" data-toggle="modal">新增广告</a>
				</small>
			</div>

			<table class="table table-hover table-striped">
				<thead class="bg-primary">
					<th>#</th>
					<th class="hidden-xs">链接</th>
					<th class="hidden-xs">链接目标</th>
					<th class="hidden-xs">描述</th>
					<th>操作</th>
				</thead>
				<tbody>
				<c:forEach items="${ads}" var="ads">
					<tr>
						<td width="160">
							<img src="../img/slides/${ads.img}" data-toggle="popover" height="20" />
						</td>
						<td class="hidden-xs">${ads.url}</td>
						<td class="hidden-xs" width="100">${ads.target}</td>
						<td class="hidden-xs">${ads.remark}</td>
						<td width="100">
							<a href="" class="btn btn-xs btn-default" data-toggle="modal" onclick="loadBj('${ads.id}')">编辑</a>
							<a href="/adsdelete?id=${ads.id}" data-del="" class="btn btn-xs btn-danger">删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- 添加广告模态框部分 -->
		<div id="modal-add-ads" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-plus"></span>
							<span>新增广告</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-add-ads" action="/adsadd" class="form-horizontal" method="post">
							<div class="form-group">
								<div class="col-xs-12">
									<label>
										<input type="file" accept="image/*" class="hidden" id="pic" />
										<img id="img-pic" src="../img/slides/web-101-101-0.png" class="img-responsive img-thumbnail" />
									</label>
									<div class="text-muted">
										* 点击图片更换
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-2">链接</label>
								<div class="col-sm-10">
									<!--头像名称-->
									<input  id="user-photo" type="hidden" name="img" >

									<input type="text" class="form-control" name="url"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">目标</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="_top" list="target-list" name="target"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">描述</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="4" name="remark"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" type="submit" form="form-add-ads">新增广告</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //添加广告模态框部分结束 -->
		
		<!-- 编辑广告模态框部分 -->
		<div id="modal-edit-ads" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">

				</div>
			</div>
		</div>
		<!-- //编辑广告模态框部分结束 -->
		
		<!-- 用于添加/编辑广告时“链接目标”字段的选项集 -->
		<datalist id="target-list">
			<option value="_top">默认(_top)</option>
			<option value="_blank">_blank</option>
			<option value="_parent">_parent</option>
			<option value="_search">_search</option>
			<option value="_self">_self</option>
		</datalist>
		
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