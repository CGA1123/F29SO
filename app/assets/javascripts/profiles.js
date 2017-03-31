var profileSearch = function() {
  $.ajax({
    type: 'POST',
    url: 'profiles/search.js',
    data: $('#profile_search_form').serialize()
  });
};
