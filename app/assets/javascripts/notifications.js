// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var getNotifications = function () {
  $.ajax({
    url: '/notifications.json',
    method: 'GET',
    dataType: 'JSON'
  }).success( function(data) { showNotifications(data); } );
};

var showNotifications = function(data) {
  console.log(data);
};
