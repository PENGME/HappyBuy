<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-header" >
    <button class="close" data-dismiss="modal">
        <span class="glyphicon glyphicon-remove"></span>
        <span class="sr-only">关闭</span>
    </button>
    <div class="modal-title">
        <span class="glyphicon glyphicon-th-list"></span>
        <span>用户详细</span>
    </div>
</div>
<div class="modal-body">
    <form class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-4">
                <img src="img/users/${use.photo}" class="img-thumbnail img-responsive img-circle" />
            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <div class="form-group">
                        <label class="control-label col-xs-3">用户名</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">${use.login}</div>

                        </div>

                        <label class="control-label col-xs-3">姓名</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">${use.name}</div>
                        </div>

                        <label class="control-label col-xs-3">性别</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">${use.sex}</div>
                        </div>

                        <label class="control-label col-xs-3">生日</label>
                        <div class="col-xs-9">
                            <fmt:formatDate value="${use.birthday}" var="birthday" pattern="yyyy-MM-dd"/>
                            <div class="form-control-static">${birthday}</div>
                        </div>

                        <label class="control-label col-xs-3">角色</label>
                        <div class="col-xs-9">
                            <div class="form-control-static">${use.isMaster eq 1 ? '管理员':'用户'}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>

