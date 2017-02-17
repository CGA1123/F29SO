var loadGroupUsers = function(group) {
  $.ajax({
    url: "/groups/"+group+"/users.js",
    cache: false
  });
};
