// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var toggle_notification = function() {
  var x = $('#notification-dropdown');
  if(x.hasClass('show')) {
    x.removeClass('show');
  } else {
    x.addClass('show');
  }
}

var getNotifications = function () {
  $.ajax({
    url: '/notifications.json',
    method: 'GET',
    dataType: 'JSON'
  }).success( function(data) { showNotifications(data); } );
};

var showNotifications = function(data) {
  $('#notifications-count').html(data.length);
};

// call getNotifications() on document ready
$(getNotifications);
