var loadProjectLocations = function(project) {
  $.ajax({
    url: '/projects/' + project + '/locations.js',
    cache: false
  });
};
