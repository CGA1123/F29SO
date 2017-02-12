var loadGroupUsers = function(group) {
  $.ajax({
    url: "/groups/"+group+"/users.js",
    cache: false
  });
};

var loadGroupPermissions = function(group) {
  $.ajax({
    url: "/groups/"+group+"/permissions.js",
    cache: false
  });
};
