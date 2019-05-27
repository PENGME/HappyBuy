$(function() {

	$(':input').on('invalid input', function() {
		var $formGroup = $(this).parents('.form-group:first');
		if(event.type == 'input') {
			$formGroup.removeClass('has-error');
		} else {
			$formGroup.addClass('has-error');
		}
	});

	$(document).on('click', 'a[data-del]', function() {
		if(!confirm('确认删除信息？')) {
			event.preventDefault();
		}
	});

	$(document).on('click', 'button[data-del]', function() {
		if(confirm('确定删除数据？')) {
			var $tr = $(this).parents('tr');
			$tr.fadeOut('fast', function() {
				$(this).remove();
			});
		}
	});

	var $option = $.getUrlParam('option');
	if($option == 'add') {
		$('.modal[id^="modal-add"]').modal('show');
	}
});

//为JQuery扩展一个方法，用于获取URL中的参数
(function($) {
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r != null) return unescape(r[2]);
		return null;
	}
})(jQuery);