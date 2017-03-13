var loadProjectRolePermissions = function(project, role) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + role + '/permissions.js',
    cache: false
  });
};

var loadProjectRoleUsers = function(project, role) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + role + '/users.js',
    cache: false
  });
};

var loadProjectRoleLocations = function(project, role) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + role + '/locations.js',
    cache: false
  });
};

var updateProjectRolePermission = function(project, role, element) {
  if(element.checked) {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + role + "/permissions.js",
      data: { permissions: element.value },
      cache: false
    });
  } else {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + role + "/permissions.js",
      data: { permissions: element.value, _method: 'delete' },
      cache: false
    });
  }
};

var loadProjectRoleSkills = function(project, role) {
  $.ajax({
    url: '/projects/' + project + '/roles/' + role + '/skills.js',
    cache: false
  });
}
