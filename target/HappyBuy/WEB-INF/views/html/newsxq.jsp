<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-header">
    <button class="close" data-dismiss="modal">
        <span class="glyphicon glyphicon-remove"></span>
        <span class="sr-only">关闭</span>
    </button>
    <div class="modal-title">
        <span class="glyphicon glyphicon-list"></span>
        <span>新闻公告详细</span>
    </div>
</div>
<div class="modal-body">
    <div class="panel panel-primary">
        <div class="panel-body">
            <label class="h3">${n.title}</label>
            <hr />
            <div>${n.content}</div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
