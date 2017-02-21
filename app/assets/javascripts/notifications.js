// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var toggle_notification = function() {
  $('#notification-dropdown').toggle();
}

var getNotifications = function () {
  $.ajax({
    url: '/notifications.json',
    method: 'GET',
    dataType: 'JSON'
  }).success( function(data) { showNotifications(data); } );
};

var showNotifications = function(data) {
  l = data.length;
  $('#notifications-count').html(l);
  dropdown = $('#notification-dropdown');
  dropdown.empty();
  for(var i = 0; i < l; i++) {
    notification = data[i];
    notification_html = '<a href=' + notification['url'] + '>' + notification['message'] + '</a>'
    dropdown.append(notification_html);
  }
};

// call getNotifications() on document ready (through turbolinks)
$(document).on('turbolinks:load', function() { getNotifications(); });

