var loadProjectRoles = function(project) {
  $.ajax({
    url: '/projects/' + project + '/roles.js',
    cache: false
  });
};

var loadProjectLocations = function(project) {
  $.ajax({
    url: '/projects/' + project + '/locations',
    cache: false
  });
}
