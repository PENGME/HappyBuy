<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-header">
    <button class="close" data-dismiss="modal">
        <span class="glyphicon glyphicon-remove"></span>
        <span class="sr-only">关闭</span>
    </button>
    <div class="modal-title">
        <span class="glyphicon glyphicon-edit"></span>
        <span>编辑新闻公告</span>
    </div>
</div>
<div class="modal-body">
    <form id="form-edit-news" action="/newsupdate" class="form-horizontal" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2">标题</label>
            <div class="col-sm-10">
                <input value="${n.id}" name="id" type="hidden">
                <input type="text" name="title" class="form-control" required="required" value="${n.title}"/>
            </div>
</div>
        <div class="form-group">
            <label class="control-label col-sm-2">内容</label>
            <div class="col-sm-10">
                <textarea rows="5" class="form-control" required="required" name="content" >
                  ${n.content}
                </textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">时间</label>
            <div class="col-sm-10">
                <fmt:formatDate value="${n.creation_time}" var="creation_time" pattern="yyyy-MM-dd"/>
                <div class="form-control-static" >${creation_time}</div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button class="btn btn-success" type="submit" form="form-edit-news">更新新闻公告</button>
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
