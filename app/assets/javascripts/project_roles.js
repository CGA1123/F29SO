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

var updateProjectRoleUser = function(project, role, element) {
  if(element.checked) {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + role + "/users.js",
      data: { id: element.value },
      cache: false
    });
  } else {
    $.ajax({
      type: "POST",
      url: "/projects/" + project + "/roles/" + role + "/users.js",
      data: { id: element.value, _method: 'delete' },
      cache: false
    });
  }
}
