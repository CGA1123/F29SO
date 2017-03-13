var updateProjectRoleSkill = function(project, role, skill, rating) {
  $.ajax({
    type: 'PATCH',
    url: '/projects/' + project + '/roles/' + role + '/skills',
    data: { skill_id: skill, rating: rating, _method: 'patch'  }
  });
};
