var loadProjectGroupPermissions = function(project, group) {
  $.ajax({
    url: '/projects/' + project + '/groups/' + group + '/permissions.js',
    cache: false
  });
};

var updateProjectGroupPermission = function(project, group, element) {
  if(element.checked) {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/groups/" + group + "/permissions.js",
      data: { permissions: element.value },
      cache: false
    });
  } else {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/groups/" + group + "/permissions.js",
      data: { permissions: element.value, _method: 'delete' },
      cache: false
    });
  }
};
