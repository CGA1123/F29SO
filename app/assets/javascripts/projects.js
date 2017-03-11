var loadProjectRoles = function(project) {
  $.ajax({
    url: '/projects/' + project + '/project_roles.js',
    cache: false
  });
};

var loadProjectLocations = function(project) {
  $.ajax({
    url: '/projects/' + project + '/project_locations.js',
    cache: false
  });
}
