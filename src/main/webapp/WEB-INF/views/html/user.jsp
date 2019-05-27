<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购 - 用户管理</title>
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
    <!--JQuery框架的颜色处理支持-->
    <script src="js/jquery.color-2.1.2.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('#pic').on('input', function () {
                var file = this.files[0];
                var url = '/upload';

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
                        $('#img-pic').attr('src', '/img/users/' + name);
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
        function loadPage(login) {
            $('#modal-show-user').modal('show');
            var url = "/dzuser?login=" + login;
            $('#modal-show-user .modal-content').load(url);
        }
    </script>
    <script type="text/javascript">
        function loadBj(id) {
            $('#modal-edit-user').modal('show');
            var url = "/findbyuser?id=" + id;
            $('#modal-edit-user .modal-content').load(url);
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
                <img src="../img/logo.png" alt="Happy Go"/>
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
    <div class="h3 page-header">
        <span>用户管理</span>
        <small class="pull-right">
            <a href="#modal-add-user" class="btn btn-xs btn-primary" data-toggle="modal">新增用户</a>
        </small>
    </div>

    <table class="table table-hover table-striped">
        <thead class="bg-primary">
        <tr>
            <th class="hidden-xs">#</th>
            <th>用户名</th>
            <th>姓名</th>
            <th class="hidden-xs">性别</th>
            <th class="hidden-xs hidden-sm">电话</th>
            <th class="hidden-xs hidden-sm">生日</th>
            <th>角色</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="use" items="${pageInfo.list}">
            <tr>
                <td class="hidden-xs user-img">
                    <img src="../img/users/${use.photo}" class="img-circle"/>
                </td>
                <td>${use.login}</td>
                <td>${use.name}</td>
                <td class="hidden-xs">${use.sex}</td>
                <td class="hidden-xs hidden-sm">${use.phone}</td>
                <fmt:formatDate value="${use.birthday}" var="birthday" pattern="yyyy-MM-dd"/>
                <td class="hidden-xs hidden-sm">${birthday}</td>
                <td>
                    <span class="glyphicon glyphicon-user text-primary"></span>
                    <span class="hidden-xs">

								${use.isMaster eq 1? '管理员':'用户'}
							</span>
                </td>
                <td class="dropdown" width="80">
                    <button data-toggle="dropdown" class="btn btn-xs btn-primary">
                        <span>管理</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="" data-toggle="modal" onclick="loadPage('${use.login}')">详细</a>
                        </li>
                        <li>
                            <a href="" data-toggle="modal" onclick="loadBj('${use.id}')">编辑</a>
                        </li>
                        <c:if test="${use.id ne user.id}">
                        <li class="divider"></li>
                        <li>
                            <a href="/deleteuser?id=${use.id}" data-del="">
                                <span class="text-danger">删除</span>
                            </a>
                        </li>
                        </c:if>
                    </ul>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="8">
                <div class="container">
                    <div style="float: left">
                    <span>第${pageInfo.pageNum}/${pageInfo.pages}页，共${pageInfo.total}条数据，每页显示${pageInfo.pageSize}条，当前显示第${pageInfo.startRow}-${pageInfo.endRow}条。</span>
                    </div>
                    <div style="margin-top: -22px">
                    <ul class="pagination pagination-sm">
                        <li class="page-item" ${pageInfo.hasPreviousPage?'':'data-dis'}>
                            <a href="/douser?pageNum=${pageInfo.prePage}" class="page-item page-link">&lt;</a>
                        </li>
                        <c:forEach var="i" items="${pageInfo.navigatepageNums}">
                            <li class="page-item ${i eq pageInfo.pageNum?'active':''}">
                                <a href="/douser?pageNum=${i}" class="page-item page-link">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item" ${pageInfo.hasNextPage?'':'data-dis'}>
                            <a href="/douser?pageNum=${pageInfo.nextPage}" class="page-item page-link">&gt;</a>
                        </li>
                    </ul>
                    </div>
                </div>
            </td>
            <script type="text/javascript">
                $(document).on('click','li[data-dis]',function () {
                    event.preventDefault();
                });
            </script>
        </tr>
        </tfoot>
    </table>
</div>

<!-- 用户详细模态框部分 -->
<div id="modal-show-user" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- //用户详细模态框部分结束 -->

<!-- 新增用户模态框部分 -->
<div id="modal-add-user" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>
                    <span class="sr-only">关闭</span>
                </button>
                <div class="modal-title">
                    <span class="glyphicon glyphicon-plus"></span>
                    <span>新增用户详细</span>
                </div>
            </div>
            <div class="modal-body">
                <form id="form-add-user" action="/adduser" class="form-horizontal" method="post">
                    <div class="form-group">
                        <div class="col-sm-4 text-center">
                            <label>
                                <input type="file" class="hidden" id="pic" accept="image/*"/>
                                <img id="img-pic" src="../img/users/user_default.png"
                                     class="img-thumbnail img-responsive img-circle center-block"/>
                            </label>
                            <div class="text-muted">
                                *点击设置头像
                                <hr class="visible-xs"/>
                            </div>
                        </div>

                        <div class="col-sm-8">
                            <div class="container-fluid">
                                <div class="form-group form-group-sm">
                                    <label class="control-label col-xs-3">用户名</label>
                                    <div class="col-xs-9">
                                        <!--头像名称-->
                                        <input id="user-photo" type="hidden" name="photo">

                                        <input type="text" name="login" class="form-control" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <label class="control-label col-xs-3">姓名</label>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" required="required" name="name"/>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <label class="control-label col-xs-3">性别</label>
                                    <div class="col-xs-9">
                                        <div class="form-control-static">
                                            <label>
                                                <input type="radio" value="男" name="sex" checked="checked"
                                                       class="radio-inline"/>
                                                <span>帅哥</span>
                                            </label>
                                            <span>&nbsp;</span>
                                            <label>
                                                <input type="radio" value="女" name="sex" class="radio-inline"/>
                                                <span>美女</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <label class="control-label col-xs-3">生日</label>
                                    <div class="col-xs-9">
                                        <input type="date" class="form-control" name="birthday"/>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <label class="control-label col-xs-3">角色</label>
                                    <div class="col-xs-9">
                                        <div class="form-control-static">
                                            <label>
                                                <input type="radio" value="0" name="isMaster" checked="checked"
                                                       class="radio-inline"/>
                                                <span>用户</span>
                                            </label>
                                            <span>&nbsp;</span>
                                            <label>
                                                <input type="radio" value="1" name="isMaster" class="radio-inline"/>
                                                <span>管理员</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="submit" form="form-add-user">新增用户</button>
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- //新增用户模态框部分结束 -->

<!-- 编辑用户模态框部分 -->
<div id="modal-edit-user" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- //编辑用户模态框部分结束 -->

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