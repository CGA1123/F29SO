// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var getNotifications = function () {
  if($('#notifications-dropdown').length) {
    $.ajax({
      url: '/notifications.json',
      method: 'GET',
      dataType: 'JSON'
    }).success( function(data) { showNotifications(data); } );
  }
};

var showNotifications = function(data) {
  l = data.length;
  $('.notifications-count').html(l);
  notification_menu = $('#notifications-dropdown');
  notification_menu.empty();
  for(var i = 0; i < l; i++) {
    notification = data[i];
    notification_html = '<a href=' + notification['url'] + ' class="purple-text text-darken-2">' + notification['message'] + '</a>'
    notification_menu.append(notification_html);
  }

  if(l === 0) {
    notification_html = "<span class='purple-text text-darken-2'>No New Notifications</span>";
    notification_menu.append(notification_html);
  }
};

// call getNotifications() on document ready (through turbolinks)
$(document).on('turbolinks:load', function() { getNotifications(); });
