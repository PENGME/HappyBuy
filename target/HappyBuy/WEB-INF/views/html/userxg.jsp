<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--JQuery框架的颜色处理支持-->
<script src="js/jquery.color-2.1.2.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        $('#pic2').on('input', function () {
            var file = this.files[0];
            //alert(file);
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
                    $('#img-pic2').attr('src', '/img/users/' + name);
                    $('#user-photo2').val(name);
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

<div class="modal-header">
    <button class="close" data-dismiss="modal">
        <span class="glyphicon glyphicon-remove"></span>
        <span class="sr-only">关闭</span>
    </button>
    <div class="modal-title">
        <span class="glyphicon glyphicon-plus"></span>
        <span>编辑用户详细</span>
    </div>
</div>
<div class="modal-body">
    <form id="form-edit-user" action="/updateuser" class="form-horizontal" method="post">
        <div class="form-group">
            <div class="col-sm-4 text-center">
                <label>
                    <input type="file" class="hidden" id="pic2" accept="image/*"/>
                    <img id="img-pic2"  src="img/users/${use.photo}" class="img-thumbnail img-responsive img-circle center-block" name="photo"/>
                    <!--头像名称-->
                    <input  id="user-photo2" type="hidden" name="photo" value="${use.photo}" >
                </label>
                <div class="text-muted">
                    *点击更新头像
                    <hr class="visible-xs" />
                </div>
            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-xs-3">用户名</label>
                        <div class="col-xs-9">

                            <div class="form-control-static" readonly="readonly">${use.login}</div>
                            <input value="${use.id}" name="id" type="hidden">
                        </div>

                        <label class="control-label col-xs-3">姓名</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" name="name" required="required" value="${use.name}" />
                        </div>

                        <label class="control-label col-xs-3">性别</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">
                                <label>
                                    <input type="radio" name="sex" class="radio-inline" ${use.sex eq '男'?'checked':''} value="男"/>
                                    <span>帅哥</span>
                                </label>
                                <span>&nbsp;</span>
                                <label>
                                    <input type="radio" name="sex" checked="checked" class="radio-inline" value="女"/>
                                    <span>美女</span>
                                </label>
                            </div>
                        </div>

                        <label class="control-label col-xs-3">生日</label>
                        <div class="col-xs-9">
                            <fmt:formatDate value="${use.birthday}" var="birthday" pattern="yyyy-MM-dd"/>
                            <input type="date" class="form-control"  name="birthday" value="${birthday}" />
                        </div>

                        <label class="control-label col-xs-3">角色</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">
                                <label>
                                    <input type="radio" name="isMaster" checked="checked" class="radio-inline" value="0" />
                                    <span>用户</span>
                                </label>
                                <span>&nbsp;</span>
                                <label>
                                    <input type="radio" name="isMaster" class="radio-inline" ${use.isMaster eq 1 ?'checked':''} value="1" "/>
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
    <button class="btn btn-primary" type="submit" form="form-edit-user">更新用户</button>
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
