<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

	<head>
		<meta charset="utf-8" />
		<title>快乐购 - 商品管理</title>

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

		<!--新增文件上传-->
		<script type="text/javascript">
			$(function () {
				$('#pic').on('input', function () {
					var file = this.files[0];
					var url = '/Proupload';

					var formData = new FormData();

					formData.append("pic", file);
					console.log(formData);
					$.ajax({
						url: url,
						type: "POST",
						data: formData,
						processData: false,
						contentType: false,
						success: function (name) {
							$('#img-pic').attr('src', '/img/products/' + name);
							$('#product-photo').val(name);
						}
					});
				});
			});
		</script>

        <!--修改文件上传-->
        <script type="text/javascript">
            $(function () {
                $('#pic1').on('input', function () {
                    var file = this.files[0];
                    var url = '/Proupload';

                    var formData = new FormData();

                    formData.append("pic", file);
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (name) {
                            $('#img-pic1').attr('src', '/img/products/' + name);
                            $('#product-photo1').val(name);
                        }
                    });
                });
            });
        </script>

		<!--查看-->
		<script type="text/javascript">
			$(document).on('click', 'a[data-look]', function () {
				event.preventDefault();
				var id = $(this).data('look');
				var url='/toLook?id='+id;
				$.getJSON(url,{id:id},function (data) {
					<!--给每个模态框复赋值-->
					$('#modal-show-product div[name=name]').text(data.name);
					$('#modal-show-product div[name=price]').text(data.price);
					$('#modal-show-product div[name=stock]').text(data.stock);
					$('#modal-show-product div[name=father]').text(data.productCategory.productCategory.name);
					$('#modal-show-product div[name=son]').text(data.productCategory.name);
					$('#modal-show-product div[name=detail]').text(data.detail);
					$('.showImg').attr("src","/img/products/"+data.url);


					$('#father').val(data.productCategory.parent_id)
					//<!--打开模态框-->
					$('#modal-show-product').modal('show');
					$("#father").change();
				});
			});

		<!--查看-->
			$(function () {
				//点击下拉  改变事件
				$("#father").change(function () {
					$.post("/productByParentId",{"id":$(this).val()},function (data) {
						var son=document.getElementById("son");
						son.options.length=0;
						$(data).each(function (index,p) {
							var option=new Option(p.name,p.id);
							son.options.add(option);
						})
					})
				})
				$("#father").change();
			})

            //新增
            $(function () {
                //点击下拉  改变事件
                $("#parent_id1").change(function () {
                    $.post("/productByParentId",{"id":$(this).val()},function (data) {
                        var son=document.getElementById("son_id1");
                        son.options.length=0;
                        $(data).each(function (index,p) {
                            var option=new Option(p.name,p.id);
                            son.options.add(option);
                        })

                    })
                })
                $("#parent_id1").change();
            })
			//编辑
			$(function () {
				//点击下拉  改变事件
				$("#parent_id").change(function () {
					$.post("/productByParentId",{"id":$(this).val()},function (data) {
						var son=document.getElementById("son_id");
						son.options.length=0;
						$(data).each(function (index,p) {
                        var option=new Option(p.name,p.id);
                        son.options.add(option);
                    })
                })
				})
			})
		</script>



		<!--编辑-->
		<script type="text/javascript">

			$(document).on('click', 'a[data-edit]', function () {
				event.preventDefault();
				var id = $(this).data('edit');
				var url='/toLook?id='+id;
				$.getJSON(url,{id:id},function (data) {


					<!--给每个模态框复赋值-->
					$('#modal-edit-product input[name=name]').val(data.name);
					$('#modal-edit-product input[name=price]').val(data.price);
					$('#modal-edit-product input[name=stock]').val(data.stock);

					$('#modal-edit-product div[name=father]').text(data.productCategory.productCategory.name);
					$('#modal-edit-product div[name=son]').text(data.productCategory.name);

					$('#modal-edit-product textarea[name=detail]').val(data.detail);

					$('.showImg').attr("src","/img/products/"+data.url);

					$('#parent_id').val(data.productCategory.parent_id)
                    $("#id").val(data.id);
					//<!--打开模态框-->
					$('#modal-edit-product').modal('show');
                    $("#parent_id").change();

				});

			});

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
					<a href="../index.html" class="navbar-brand">
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
									<li>
										<a href="product-category.jsp">类别管理</a>
									</li>
									<li class="active">
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
				<span>商品管理</span>
				<small class="pull-right">
					<a href="#modal-add-product" class="btn btn-xs btn-primary" data-toggle="modal">新增商品</a>
				</small>
			</div>

			<!-- 商品名称搜索表单 -->
			<form action="/ProFindAll" method="post" class="form-inline">
				<div class="form-group form-group-sm">
					<label class="control-label">商品名称</label>
					<input type="search" class="form-control" placeholder="输入商品名称关键字..." name="dim" value="${dim}"/>
					<button class="btn btn-sm btn-default">
						<span class="glyphicon glyphicon-zoom-in"></span>
						<span class="sr-only">搜索</span>
					</button>
				</div>
			</form>

			<br />

			<!-- 商品数据 -->
			<table class="table table-hover table-striped">
				<thead class="bg-primary">
					<tr>
						<th>#</th>
						<th>名称</th>
						<th>单价(元)</th>
						<th>库存</th>
						<th class="hidden-xs">分类</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				<%--@elvariable id="products" type="java.util.List<com.hr.sm.entity.Product>"--%>
				<c:forEach items="${products.list}" var="c">
					<tr>
						<td>
							<img src="/img/products/${c.url}" height="20" />
						</td>
						<td>
							<div class="product-title">${c.name}</div>
						</td>
						<td>${c.price}</td>
						<td>${c.stock}</td>
						<td class="hidden-xs">
							<span class="text-info">${c.productCategory.productCategory.name}</span>
							<span class="hidden-sm">-</span>
							<div class="hidden-md hidden-lg"></div>
							<span class="text-info">${c.productCategory.name}</span>
						</td>
						<td>
							<div class="dropdown">
								<button class="btn btn-xs btn-primary" data-toggle="dropdown">
									<span>管理</span>
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li>
										<a data-look="${c.id}"  data-toggle="modal">查看</a>

									</li>
									<li>
										<a data-edit="${c.id}" data-toggle="modal">编辑</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="/Prodelete?id=${c.id}" data-del="">
											<span class="text-danger">移除</span>
										</a>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="6">
						<div class="container">
							<span style="float: left;" >第${products.pageNum}/${products.pages}页，共${products.total}条数据，每页显示${products.pageSize}条，当前显示第${products.startRow}-${products.endRow}条。</span>

							<ul class="pagination pagination-sm" style="margin-top: -3px">
							<li class="page-item" ${products.hasPreviousPage?'':'data-dis'}>
								<a  href="/ProFindAll?pageNum=${products.prePage}" class="page-item page-link">&lt;</a>
							</li>
							<c:forEach var="i" items="${products.navigatepageNums}">
								<li class="page-item ${i eq products.pageNum?'active':''}">
									<a    href="/ProFindAll?pageNum=${i}" class="page-item page-link">${i}</a>
								</li>
							</c:forEach>
							<li class="page-item" ${products.hasNextPage?'':'data-dis'}>
								<a   href="/ProFindAll?pageNum=${products.nextPage}" class="page-item page-link">&gt;</a>
							</li>
						</ul>
						</div>
					</td>
				</tr>
				</tfoot>
			</table>
			<script type="text/javascript">
				$(document).on('click', 'li[data-dis]', function() {
					event.preventDefault();
				});
			</script>
		</div>

		<!-- 查看商品模态框部分 -->
		<div id="modal-show-product" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
                        </button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-zoom-in"></span>
							<span>查看商品</span>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-4">
									<div class="form-group">
										<div class="col-xs-12">
											<img src="../img/products/h.png" class="img-thumbnail img-responsive showImg" />
										</div>
									</div>
								</div>

								<div class="col-sm-8 form-horizontal">
									<div class="form-group">
										<label class="control-label col-xs-3">商品名称</label>
										<div class="col-xs-9">
											<div class="form-control-static" name="name">

											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">单价</label>
										<div class="col-xs-9">
											<div class="form-control-static" name="price">
												￥
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">库存量</label>
										<div class="col-xs-9">
											<div class="form-control-static" name="stock">

											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">类别</label>
										<div class="col-xs-9">
                                            <div  id="father"  name="father" class="form-control-static">

                                            </div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">子类别</label>
										<div class="col-xs-9">
                                            <div  id="son" name="son"  class="form-control-static">

                                            </div>
										</div>
									</div>
								</div>
								
							</div>
							
							<div class="form-group">
								<div class="col-xs-12">
									<label class="control-label">详情</label>
									<div class="form-control-static" name="detail">

									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //查看商品模态框部分结束 -->

		<!-- 新增商品模态框部分 -->
		<div id="modal-add-product" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-plus"></span>
							<span>新增商品</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-add-product" action="/Proadd" method="post" class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-4">
									<div class="form-group">
										<div class="col-xs-12">
											<label>
												<img  id="img-pic" src="../img/products/product_default.png" class="img-thumbnail img-responsive"/>
												<input type="file" id="pic" accept="image/*" class="hidden" />
											</label>
											<input type="hidden" name="url" id="product-photo"/>
											<div class="text-muted">
												*点击设置图片
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-8 form-horizontal">
									<div class="form-group">
										<label class="control-label col-xs-3">商品名称</label>
										<div class="col-xs-9">
											<input type="text" class="form-control" required="required" name="name" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">单价</label>
										<div class="col-xs-9">
											<input type="number" class="form-control" min="0.00" step="1.00" required="required" name="price" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">库存量</label>
										<div class="col-xs-9">
											<input type="number" class="form-control" min="1" required="required" name="stock" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">类别</label>
										<div class="col-xs-9">
                                            <select id="parent_id1" class="form-control" required="required" >
                                                <%--@elvariable id="p" type="com.hr.sm.entity.ProductCategory"--%>
                                                <c:forEach var="p" items="${plist}">
                                                    <c:if test="${p.parent_id==null}">
                                                        <option value="${p.id}">${p.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-xs-3">子类别</label>
										<div class="col-xs-9">
                                            <select id="son_id1" class="form-control" required="required" name="category_id"></select>
										</div>
									</div>

								</div>
							</div>
							
							<div class="form-group">
								<div class="col-xs-12">
									<label class="control-label">详情</label>
									<textarea class="form-control" rows="5" name="detail"></textarea>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit" form="form-add-product">新增商品</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //新增商品模态框部分结束 -->
		
		<!-- 编辑商品模态框部分 -->
		<div id="modal-edit-product" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>
							<span class="sr-only">关闭</span>
						</button>
						<div class="modal-title">
							<span class="glyphicon glyphicon-edit"></span>
							<span>编辑商品</span>
						</div>
					</div>
					<div class="modal-body">
						<form id="form-edit-product" action="/Proupdate" method="post" class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-4">
									<div class="form-group">
										<div class="col-xs-12">
                                            <label>
                                                <img  id="img-pic1" src="" class="img-thumbnail img-responsive showImg"/>
                                                <input type="file" id="pic1" accept="image/*" class="hidden" />
                                            </label>
                                            <input type="hidden" name="url" id="product-photo1"/>
                                            <input type="hidden" name="id" id="id"/>
											<div class="text-muted">
												*点击设置图片
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-8 form-horizontal">
									<div class="form-group">
										<label class="control-label col-xs-3">商品名称</label>
										<div class="col-xs-9">
											<input type="text" class="form-control" required="required" value="" name="name" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">单价</label>
										<div class="col-xs-9">
											<input type="number" class="form-control" min="0.00" step="1.00" required="required" value="" name="price"/>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">库存量</label>
										<div class="col-xs-9">
											<input type="number" class="form-control" min="1" required="required" value="" name="stock" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-xs-3">类别</label>
										<div class="col-xs-9">
											<select id="parent_id" class="form-control" required="required" >
												<%--@elvariable id="p" type="com.hr.sm.entity.ProductCategory"--%>
												<c:forEach var="p" items="${plist}">
													<c:if test="${p.parent_id==null}">
														<option value="${p.id}">${p.name}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-xs-3">子类别</label>
										<div class="col-xs-9">
											<select id="son_id" class="form-control" required="required" name="category_id"></select>
										</div>
									</div>

								</div>
							</div>
							
							<div class="form-group">
								<div class="col-xs-12">
									<label class="control-label">详情</label>
									<textarea class="form-control" rows="5" name="detail"></textarea>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" form="form-edit-product">更新商品</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //编辑商品模态框部分结束 -->

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