var submitSearch = function() {
  $.ajax({
    type: 'POST',
    url: 'projects/search.js',
    data: $('#project_search_form').serialize()
  });
};
