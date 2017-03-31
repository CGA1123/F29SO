#
# Seeds for all permissions required by the system
#
#   More information about each permission in PERMISSIONS.md in
#   the application root. All permissions used by the application must exist
#   in the database. If not, then the action(s) protected by that permission
#   cannot take place.
#

# Invitations
Permission.create!(name: 'users.invite', description: 'placeholder...')
Permission.create!(name: 'users.invite.delete', description: 'placeholder...')

# Profiles
Permission.create!(name: 'profile.edit', description: 'placeholder...')
Permission.create!(name: 'profile.edit.others', description: 'placeholder...')
Permission.create!(name: 'profile.skills.manage', description: 'placeholder...')
Permission.create!(name: 'profile.skills.manage.others', description: 'placeholder...')

# Projects
Permission.create!(name: 'projects.view', description: 'placeholder...')
Permission.create!(name: 'projects.edit', description: 'placeholder...')
Permission.create!(name: 'projects.create', description: 'placeholder...')
Permission.create!(name: 'projects.delete', description: 'placeholder...')

# ProjectRoles
Permission.create!(name: 'projects.roles.manage', description: 'placeholder...')

# ProjectRoleUsers
Permission.create!(name: 'projects.roles.manage.users', description: 'placeholder...')

# ProjectRolePermissions
Permission.create!(name: 'projects.roles.manage.permissions', description: 'placeholder...')

# ProjectRoleLocations
Permission.create!(name: 'projects.roles.manage.locations', description: 'placeholder...')

# ProjectRoleSkills
Permission.create!(name: 'projects.roles.manage.skills', description: 'placeholder...')

# Groups
Permission.create!(name: 'admin.groups.view', description: 'placeholder...')
Permission.create!(name: 'admin.groups.manage', description: 'placeholder...')
Permission.create!(name: 'admin.groups.manage.users', description: 'placeholder...')
Permission.create!(name: 'admin.groups.manage.permissions', description: 'placeholder...')

# AdminPanel
Permission.create!(name: 'admin.panel', description: 'placeholder...')

# Announcements
Permission.create!(name: 'announcements.manage', description: 'placeholder...')

Permission.create!(name: 'admin.users.disable'), description: 'Allows ability to disable users')
