var loadProjectRolePermissions = function(project, group) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + group + '/permissions.js',
    cache: false
  });
};

var loadProjectRoleUsers = function(project, group) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + group + '/users.js',
    cache: false
  });
};

var updateProjectRolePermission = function(project, group, element) {
  if(element.checked) {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + group + "/permissions.js",
      data: { permissions: element.value },
      cache: false
    });
  } else {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + group + "/permissions.js",
      data: { permissions: element.value, _method: 'delete' },
      cache: false
    });
  }
};
