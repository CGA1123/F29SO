// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require initial
//= require turbolinks
//= require materialize-sprockets
//= require_tree

var ready;
ready = function() {
  $('.profile-img').initial();
  $(".button-collapse").sideNav();
};

var search = function() {
  $('#search-form').submit();
};

var toggle_nav = function() {
  var x = $('#topnav');
  if(x.hasClass('responsive')) {
    x.removeClass('responsive');
  } else {
    x.addClass('responsive');
  }
}

$(document).on('turbolinks:load', function() { ready(); });
