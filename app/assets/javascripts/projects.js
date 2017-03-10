var loadProjectRoles = function(project) {
  $.ajax({
    url: '/projects/' + project + '/project_roles.js',
    cache: false
  });
};
