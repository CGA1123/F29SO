var loadProjectRoles = function(project) {
  $.ajax({
    url: '/projects/' + project + '/roles.js',
    cache: false
  });
};

var submitSearch = function() {
  console.log('change');
  $.ajax({
    type: 'POST',
    url: 'projects/search.js',
    data: $('#project_search_form').serialize()
  });
};
