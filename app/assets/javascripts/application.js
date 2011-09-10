// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.buttonify
//= require_tree .

$(document).ready(function()
{
  //$.buttonify();
});

$("#change_password_link a").click(function(){
	$("#change_password_link").hide();
	$("#password_fields").show();
	$("#user_password").focus();
});

$(".add_nested_item").click(function(){

});

 /* ".add_nested_item:click": function(e){
    link = $(this);
    template = eval(link.href.replace(/.*#/, ''))
    $(link.rel).insert({ bottom: replace_ids(template) });
    Event.addBehavior.reload();
  },*/

  $("body").bind("click", function (e) {
     $('.dropdown-toggle, .menu').parent("li").removeClass("open");
   });
   $(".dropdown-toggle, .menu").click(function (e) {
     var $li = $(this).parent("li").toggleClass('open');
     return false;
   });