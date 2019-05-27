<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

	<head>
		<meta charset="utf-8" />
		<title>快乐购 - 商品类别管理</title>

		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
					<a href="../index.jsp" class="navbar-brand">
						<img src="../img/logo.png" alt="Happy Go" />
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
							<li class="dropdown active">
								<a href="#" data-toggle="dropdown">
									<span>商品</span>
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li class="active">
										<a href="product-category.jsp">类别管理</a>
									</li>
									<li>
										<a href="product.jsp">商品管理</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="order.jsp">订单</a>
							</li>
							<li>
								<a href="user.jsp">用户</a>
							</li>
							<li>
								<a href="news.jsp">新闻</a>
							</li>
							<li>
								<a href="ads.jsp">广告</a>
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
				<span>商品类别管理</span>
				<small class="pull-right">
					<a href="#modal-add-category" class="btn btn-xs btn-primary" data-toggle="modal">新增商品类别</a>
				</small>
			</div>

            <%--@elvariable id="procatelist" type="java.util.List<com.hr.sm.entity.ProductCategory>"--%>
			<div class="panel-group">
                <c:forEach  items="${procatelist}" var="p" varStatus="i">
                    <c:if test="${p.parent_id==null}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<span class="glyphicon glyphicon-th-large"></span>
							<label>${p.name}</label>
							<div class="pull-right">
								<a href="#category-${i.index}" class="btn btn-xs btn-default" data-toggle="collapse">
									<span>所属子分类</span>
									<span class="caret"></span>
								</a>
								<a onclick="opModal1('${p.name}',${p.id})" class="btn btn-xs btn-default" >修改</a>
								<a href="/Pcdelete?id=${p.id}" class="btn btn-xs btn-danger" data-del="">移除</a>
								<script>
									function opModal1(name,id) {
										$("#modal-edit-primary-category").modal("show");
										$("input[name='name']").val(name);
										$("input[name='id']").val(id);
									}
								</script>
							</div>
						</div>
					</div>



					<div id="category-${i.index}" class="collapse  active ${i.index==0?'in':''}">
						<div class="panel-body">
							<div class="list-group">
                                <c:forEach items="${p.productCategoryList}" var="ps">
								<div class="list-group-item">
									<span class="glyphicon glyphicon-th"></span>
									<label>${ps.name}</label>
									<div class="pull-right">
										<a onclick="opModal2('${ps.name}','${ps.parent_id}','${ps.id}')" class="btn btn-xs btn-default">修改</a>
										<a href="/Pcdelete?id=${ps.id}" class="btn btn-xs btn-danger" data-del="">移除</a>
                                    </div>
								</div>
								<script>
									function opModal2(name,pid,id) {
										$("#modal-edit-category").modal("show");
										$("select[name='parent_id']").val(pid);
										$("input[name='name']").val(name);
										$("input[name='id']").val(id);
									}
								</script>

                                </c:forEach>
                                <c:if test="${p.productCategoryList.size()==0}">
                                    <div id="category-5">
                                        <div class="h3 text-center text-muted">
                                            暂无所属分类
                                        </div>
                                    </div>
                                </c:if>
							</div>
						</div>
					</div>



				</div>
                    </c:if>
                </c:forEach>
            </div>

		</div>

		<!-- 新增商品分类模态框部分 -->
		<div id="modal-add-category" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-th-list"></span>
							<span>新增商品类别</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-add-category" action="/Pcadd" method="post" class="form-horizontal">
							<div class="form-group">
								<div class="form-control-static col-xs-9 col-sm-10 col-xs-offset-3 col-sm-offset-2">
									<label>
										<input type="radio" name="ctype" value="hide" checked="checked" class="radio-inline" />
										<span>商品主类别</span>
									</label>
									<span>&nbsp;</span>
									<label>
										<input type="radio" name="ctype" value="show" class="radio-inline" />
										<span>商品子类别</span>
									</label>
								</div>
							</div>

							<div id="list-primary-category" class="collapse collapsed">
								<div class="form-group">
									<label class="control-label col-xs-3 col-sm-2">主类别</label>
									<div class="col-xs-9 col-sm-10">
										<select class="form-control" name="parent_id">
                                            <c:forEach items="${procatelist}" var="pc">
                                                <c:if test="${pc.parent_id==null}">
											<option value="${pc.id}">${pc.name}</option>
                                                </c:if>
                                            </c:forEach>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-xs-3 col-sm-2">商品类别</label>
								<div class="col-xs-9 col-sm-10">
									<input type="text" class="form-control" name="name" required="required" />
								</div>
							</div>
							<script type="text/javascript">
                                $(function () {
                                  $("select[name='parent_id']").val("");
                                })
                                $("input[value='show']").click(function () {
                                    $("select[name='parent_id']").val(1);
                                })
                                $("input[value='hide']").click(function () {
                                    $("select[name='parent_id']").val("");
                                })

								$('#list-primary-category').on('show.bs.collapse hide.bs.collapse', function() {
									$('[name="ctype"]').attr('disabled', true);
								});
								$('#list-primary-category').on('shown.bs.collapse hidden.bs.collapse', function() {
									$('[name="ctype"]').attr('disabled', false);
								});

								$('[name="ctype"]').change(function() {
									$('#list-primary-category').collapse(this.value);
								});
								//var form = $('#form-add-category').get(0);
								//form.elements['ctype'].value
							</script>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" form="form-add-category">新增商品类别</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //新增商品分类模态框部分结束 -->
		
		<!-- 编辑商品主类别模态框部分 -->
		<div id="modal-edit-primary-category" data-edit="" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-th-large"></span>
							<span>编辑商品主类别</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-edit-primary-category" action="/Pcupdate" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-xs-3 col-sm-2">商品类别</label>
								<div class="col-xs-9 col-sm-10">
									<input type="hidden" name="id" />
									<input type="text" class="form-control" required="required" name="name" />
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-edit="" form="form-edit-primary-category">更新商品主类别</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //编辑商品主类别模态框部分结束 -->
		
		<!-- 编辑商品子类别模态框部分 -->
		<div id="modal-edit-category" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-th"></span>
							<span>编辑商品子类别</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-edit-category" action="/Pcupdate" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-xs-3 col-sm-2">主类别</label>
								<div class="col-xs-9 col-sm-10">
									<select class="form-control" name="parent_id">
										<c:forEach items="${procatelist}" var="pc">
											<c:if test="${pc.parent_id==null}">
												<option value="${pc.id}">${pc.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-xs-3 col-sm-2">商品类别</label>
								<div class="col-xs-9 col-sm-10">
									<input type="hidden" name="id" />
									<input type="text" class="form-control" name="name" required="required"   />
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" form="form-edit-category">更新商品子类别</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //编辑商品子类别模态框部分结束 -->

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