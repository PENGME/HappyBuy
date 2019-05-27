<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>快乐购 - 个人资料</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="css/normalize.min.css" />
    <link rel="stylesheet" type="text/css" href="css/default.css" />

    <!-- JS -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/respond.min.js" type="text/javascript" charset="utf-8"></script>
    <![endif]-->

    <script type="text/javascript">
        $(function () {
            $('#pic').on('input', function () {
                var file = this.files[0];
                var url = '/upload';

                var formData = new FormData();

                formData.append("pic", file);

                $.ajax({
                    url: url,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (name) {
                        $('#img-pic').attr('src', '/img/users/' + name);
                        $('#user-photo').val(name);
                    }
                });


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
            <a href="index.html" class="navbar-brand">
                <img src="img/logo.png" alt="Happy Go"/>
            </a>
        </div>
        <div id="navbar-menu1" class="navbar-collapse collapse">
            <div class="navbar-text">
                <span>${user.login}</span>
                <span>欢迎来到快乐购！&nbsp;</span>
                <div class="visible-xs"></div>
                <c:if test="${empty  user}">
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
                    <li class="active">
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


<!-- 页面主体部分 -->
<div class="container">

    <!-- 个人资料部分 -->
    <div class="row">
        <div class="col-xs-12">
            <div class="h3 page-header">
                <span>个人资料</span>
                <small>
                    <a href="/AddrfindAll?user_id=${user.id}">收货地址管理</a>
                </small>
            </div>

            <form action="/userupdate" onsubmit=" return checkpwd()" method="post" class="form-horizontal">
                <div class="col-sm-3">
                    <div class="form-group">
                        <div class="text-center">
                            <label style="cursor: pointer;">
                                <img id="img-pic" src="img/users/${user.photo}" alt="单击头像可以更换新头像" width="200"
                                     height="200" border="1" class="img-thumbnail img-responsive center-block"/>
                                <input type="file" id="pic" accept="image/*" class="hidden"/>

                            </label>
                            <input type="hidden" name="photo" id="user-photo"/>
                            <div class="small">* 单击头像可以更换新头像</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">用户名</label>
                        <div class="col-sm-9 col-md-10">
                            <input type="text" class="form-control" name="login" value="${user.login}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">姓名</label>
                        <div class="col-sm-9 col-md-10">
                            <input type="text" class="form-control" name="name" value="${user.name}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">密码</label>
                        <div class="col-sm-9 col-md-10">
                            <input type="password" name="pwd" id="pwd1" class="form-control"
                                   placeholder="若要修改密码请输入新密码"/>
                        </div>
                    </div>
                    <div class="form-group" id="ispwd">
                        <label class="control-label col-sm-3 col-md-2">确认密码</label>
                        <div class="col-sm-9 col-md-10">
                            <input type="password" id="pwd2" class="form-control"/>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">性别</label>
                        <div class="col-sm-9 col-md-10">
                            <div class="">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="男"  ${user.sex eq '男'?'checked':''}/>
                                    <span>帅哥</span>
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="女"  ${user.sex eq '女'?'checked':''}/>
                                    <span>美女</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">生日</label>
                        <div class="col-sm-9 col-md-10">
                            <fmt:formatDate value="${user.birthday}" var="b" pattern="yyyy-MM-dd"/>
                            <input type="date" name="birthday" class="form-control" value="${b}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 col-md-2">联系电话</label>
                        <div class="col-sm-9 col-md-10">
                            <input type="tel" class="form-control" name="phone" value="${user.phone}"/>
                        </div>
                    </div>
                </div>

                <div class="col-sm-9">
                    <div class="text-right">
                        <button class="btn btn-lg btn-success">更新个人资料</button>
                    </div>
                </div>
            </form>
        </div>
        <h1 class="clearfix"></h1>
    </div>
    <!-- //个人资料部分结束 -->

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