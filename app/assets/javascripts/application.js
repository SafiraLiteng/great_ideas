// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
// = require jquery
// = require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .




$(document).ready(function(){
	//let menu = $('.body');
	$('.title').click(function(event){
		event.preventDefault();
		let ideaBody = $(this).closest('.idea-wrapper').find('.body');
		if (ideaBody.is(":visible"))
		{
			ideaBody.slideUp(400);
			$(this).removeClass("open");
		}
		else
		{
			ideaBody.slideDown(400);
			$(this).addClass("open");
		}
	});
});
