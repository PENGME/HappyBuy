<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--JQuery框架的颜色处理支持-->
<script src="js/jquery.color-2.1.2.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        $('#pic2').on('input', function () {
            var file = this.files[0];
            //alert(file);
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
                    $('#img-pic2').attr('src', '/img/slides/' + name);
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
        <span class="glyphicon glyphicon-edit"></span>
        <span>编辑广告</span>
    </div>
</div>
<div class="modal-body">
    <form id="form-edit-ads" action="/adsupdate" class="form-horizontal">
        <div class="form-group">
            <div class="col-xs-12">
                <label>
                    <input type="file" accept="image/*" class="hidden" id="pic2"/>
                    <img id="img-pic2" src="img/slides/${ads.img}" class="img-responsive img-thumbnail" name="img"/>
                    <!--头像名称-->
                    <input  id="user-photo2" type="hidden" name="img" value="${ads.img}" >
                </label>
                <div class="text-muted">
                    * 点击图片更换
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">链接</label>
            <div class="col-sm-10">
                <input value="${ads.id}" name="id" type="hidden">
                <input type="text" class="form-control" name="url" value="${ads.url}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">目标</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="${ads.target}" list="target-list" name="target"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">描述</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="4" name="remark">${ads.remark}</textarea>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-success" type="submit" form="form-edit-ads">更新广告</button>
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
