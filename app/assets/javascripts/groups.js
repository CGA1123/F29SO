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

var updatePermission = function(group, element) {
  if(element.checked) {
    console.log("Checked: " + element.value);
    $.ajax({
      type: "POST",
      url: "/groups/"+group+"/permissions.js",
      data: { permissions: element.value },
      cache: false
    });
  } else {
    console.log("Unchecked: " + element.name);
    $.ajax({
      type: "POST",
      url: "/groups/"+group+"/permissions.js",
      data: { permissions: element.value, _method: 'delete' },
      cache: false
    });
  }
};
