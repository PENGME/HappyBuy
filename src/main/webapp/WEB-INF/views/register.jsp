<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>注册</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <!-- JS -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
        function refreshCode(){
            //1,获得标签对象veryCode
            var veryCode = document.getElementById("veryCode");

            //2，改变img的src
            var dt = new Date();
            //每次传给后台一个变化的值。作用：每次都可以刷新验证码
            veryCode.src="/YanzmServlet?datetimes="+dt;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#pwd2").blur(function () {
                var val2=this.value;
                var val1=$("#pwd1").val();
                if(val1!=val2){
                    $(this).after("<small  style='color:red'>*两次输入密码不一致</small >");
                }else {
                    $(this).after("<small  style='color:green'>√</small >");
                }
            })
            $("#pwd2").focus(function () {
               $(this).parent().find("small").remove();
            })

            $("#login").blur(function () {
                $.post("/yongHu",{"login":$(this).val()},function (data) {
                   if (data==1){
                       $("#login").after("<small  style='color:red'>*用户名已存在</small >");
                   }else {
                       $("#login").after("<small  style='color:green'>√</small >");
                   }
                })
            })
            $("#login").focus(function () {
                $(this).parent().find("small").remove();
            })
        })
    </script>
</head>
<body>
<!-- 导航条开始 -->
<nav class="navbar navbar-expand navbar-light bg-light">
    <div class="container">
        <a href="#navbar-collapse-content" class="navbar-toggler">
            <i class="navbar-toggler-icon"></i>
        </a>
        <a href="index.jsp" class="navbar-brand">
            <img src="img/logo.png" alt="Happy Go"/>
        </a>
        <div id="navbar-collapse-content" class="collapse navbar-collapse">
            <div class="navbar-text">
                <span>欢迎来到快乐购！&nbsp;</span>
            </div>
            <div class="navbar-nav">
                <a href="/tologin" class="nav-item nav-link">登录</a>
            </div>
            <img src="img/top_center.jpg" class="img-responsive ml-auto d-none d-lg-inline"/>
        </div>
    </div>
</nav>
<!-- //导航条结束 -->

<!-- 页面主体部分 -->
<div class="container mt-2">
    <div class="row">
        <div class="col order-md-last">
            <h4>
                <span class="text-danger">注册快乐购</span>
            </h4>
            <span>有快乐购账号?</span>
            <a href="/tologin">去登录</a>

            <form action="/doregister" class="mt-2" method="post">
                <div class="form-group form-row">
                    <label for="login" class="col-form-label col-form-label-sm pr-3 mr-1">用户名</label>
                    <input name="yong" id="login" class="col form-control form-control-sm" required="required"
                           autofocus="autofocus"
                           value="${yong}"/>
                </div>

                <div class="form-group form-row">
                    <label for="pwd1" class="col-form-label col-form-label-sm pr-3 mr-3">密码</label>
                    <input name="pass" id="pwd1" type="password" class="col form-control form-control-sm"
                           required="required"/>
                </div>

                <div class="form-group form-row">
                    <label for="pwd2" class="col-form-label col-form-label-sm">确认密码</label>
                    <input name="newpass" id="pwd2" type="password" class="col form-control form-control-sm"
                           required="required"/>
                </div>

                <div class="form-group form-row">
                    <label for="code" class="col-form-label col-form-label-sm pr-3 mr-1">验证码</label>
                    <div class="col p-0 input-group input-group-sm">
                        <input name="code" id="code" class="form-control form-control-sm" required="required"/>
                        <div class="input-group-append">
                            <img id="veryCode" src="YanzmServlet" onclick="refreshCode();" alt="验证码" title="单击刷新验证码"
                                 class="img-fluid input-group-text bg-white yzm"/>
                        </div>
                    </div>
                </div>

                <div class="form-group form-row">
                    <small id="login-error2-message" class="text-danger ml-5">${error2}</small>
                    <small id="login-error3-message" class="text-danger">${error3}</small>
                    <small id="login-error1-message" class="text-danger">${error1}</small>
                </div>
                <script>
                    $(function () {
                        $("#login").mousedown(function () {
                            $("#login-error2-message").text("");
                            $("#login-error1-message").text("");
                            $("#login-error3-message").text("");
                        })
                    })
                </script>
                <div class="form-group form-row justify-content-end">
                    <button class="btn btn-sm btn-outline-success">注册快乐购</button>
                </div>
            </form>
        </div>

        <div class="col-md-7">
            <img src="img/register_img.jpg" class="img-thumbnail img-responsive" style="width: 100%;"/>
        </div>
    </div>
</div>
<!-- //页面主体部分结束 -->

<!-- 页面脚部部分 -->
<footer class="mt-2">
    <div class="container">
        <div class="row">
            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip1.png" class="img-responsive center-block"/>
                <div class="text-danger">上市企业</div>
                <div class="small text-muted">股票代码000001</div>
            </div>

            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip2.png" class="img-responsive center-block"/>
                <div class="text-danger">快乐购严选</div>
                <div class="small text-muted">正品行货 品质保证</div>
            </div>

            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip3.png" class="img-responsive center-block"/>
                <div class="text-danger">10天无理由退货</div>
                <div class="small text-muted">为您提供售后无忧保障</div>
            </div>

            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip4.png" class="img-responsive center-block"/>
                <div class="text-danger">满129免邮</div>
                <div class="small text-muted">在线支付 购物包邮</div>
            </div>

            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip5.png" class="img-responsive center-block"/>
                <div class="text-danger">微笑无时无刻</div>
                <div class="small text-muted">365*24小时人工服务</div>
            </div>

            <div class="col-6 col-md-4 col-lg mb-2 text-center">
                <img src="img/foot_img_tip6.png" class="img-responsive center-block"/>
                <div class="text-danger">闪电物流</div>
                <div class="small text-muted">闪电发货 次日必达</div>
            </div>
        </div>
    </div>
    <hr/>
    <div class="container">
        <div class="row">

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <a href="#">使用帮助</a>
                    <a href="#">税费收取规则</a>
                    <a href="#">新手指南</a>
                    <a href="#">常见问题</a>
                    <a href="#">用户协议</a>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <a href="#">使用帮助</a>
                    <a href="#">税费收取规则</a>
                    <a href="#">新手指南</a>
                    <a href="#">常见问题</a>
                    <a href="#">用户协议</a>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <a href="#">使用帮助</a>
                    <a href="#">税费收取规则</a>
                    <a href="#">新手指南</a>
                    <a href="#">常见问题</a>
                    <a href="#">用户协议</a>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <a href="#">使用帮助</a>
                    <a href="#">税费收取规则</a>
                    <a href="#">新手指南</a>
                    <a href="#">常见问题</a>
                    <a href="#">用户协议</a>
                </div>
            </div>

            <div class="w-100 d-sm-none"></div>

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <div>手机快乐购</div>
                    <img src="img/footer_ewm_01.png" alt="" class="img-fluid">
                    <div>下载移动客户端</div>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg mb-2">
                <div class="text-center d-flex flex-column">
                    <div>快乐微信购</div>
                    <img src="img/footer_ewm_02.png" alt="" class="img-fluid">
                    <div>快乐购官方微信</div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm my-2 d-flex justify-content-sm-end justify-content-center">
                <img src="img/foot_img3.png" class="img-responsive center-block" alt="">
            </div>
            <div class="col-sm my-2 d-flex justify-content-sm-start justify-content-center">
                <img src="img/foot_img4.png" class="img-responsive center-block" alt="">
            </div>
        </div>

        <div class="row">
            <div class="col text-center small text-muted">
                <div>Rights Reserved 免费服务热线: 400-800-0001 | 固话也可拨打: 800-000-0001 E-Mail: service@happygo.com</div>
                <div>湘ICP备10000001号 信息网络传播视听节目许可证号：1000001</div>
            </div>
        </div>
    </div>
</footer>
<!-- //页面脚部部分结束 -->
</body>
</html>