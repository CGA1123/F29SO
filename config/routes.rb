Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    authenticated :user do
      root 'pages#user_home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # ProfilesController Routes
  get 'profile/:id', to: 'profiles#show', as: :profile
  patch 'profile/:id', to: 'profiles#update'
  get 'profile/:id/edit', to: 'profiles#edit', as: :edit_profile

  # UserSkillsController Routes
  get 'profile/:id/skills', to: 'user_skills#index', as: :user_skills
  post 'profile/:id/skills', to: 'user_skills#create'
  patch 'profile/:id/skills', to: 'user_skills#update'
  delete 'profile/:id/skills', to: 'user_skills#destroy'

  # InvitationsController Routes
  get 'admin/invitations', to: 'invitations#index', as: :invitations
  post 'admin/invitations', to: 'invitations#create'
  delete 'admin/invitations', to: 'invitations#destroy'
  get 'invitations/accept', to: 'invitations#accept', as: :accept_invitation
  post 'invitations/accept', to: 'invitations#create_user'

  # ProjectsController Routes
  get 'projects', to: 'projects#index', as: :projects
  post 'projects', to: 'projects#create'
  delete 'projects', to: 'projects#destroy'
  patch 'projects', to: 'projects#update'
  post 'projects/search', to: 'projects#search', as: :project_search
  get 'projects/:code', to: 'projects#show', as: :project
  get 'projects/:code/edit', to: 'projects#edit', as: :edit_project

  # ProjectTypesController
  get 'project_types', to: 'project_types#index', as: :project_types
  post 'project_types', to: 'project_types#create', as: :project_type
  delete 'project_types', to: 'project_types#destroy'
  patch 'project_types', to: 'project_types#update'
  get 'project_types/:id/edit', to: 'project_types#edit', as: :edit_project_type

  # ProjectRolesController Routes
  post 'projects/:code/roles', to: 'project_roles#create', as: :project_roles
  delete 'projects/:code/roles', to: 'project_roles#destroy'

  # ProjectRolePermissionsController Routes
  get 'projects/:code/roles/:name/permissions', to: 'project_role_permissions#index', as: :project_role_permissions
  post 'projects/:code/roles/:name/permissions', to: 'project_role_permissions#create'
  delete 'projects/:code/roles/:name/permissions', to: 'project_role_permissions#destroy'

  # ProjectRoleUsersController Routes
  post 'projects/:code/roles/:name/users', to: 'project_role_users#create'
  delete 'projects/:code/roles/:name/users', to: 'project_role_users#destroy'
  post 'projects/:code/roles/:name/users/search', to: 'project_role_users#search', as: :project_role_users_search

  # ProjectRoleLocations Routes
  get 'projects/:code/roles/:name/locations', to: 'project_role_locations#index', as: :project_role_locations
  post 'projects/:code/roles/:name/locations', to: 'project_role_locations#create'
  delete 'projects/:code/roles/:name/locations', to: 'project_role_locations#destroy'

  # ProjectRoleSkills Routes
  post 'projects/:code/roles/:name/skills', to: 'project_role_skills#create', as: :project_role_skills
  delete 'projects/:code/roles/:name/skills', to: 'project_role_skills#destroy'
  patch 'projects/:code/roles/:name/skills', to: 'project_role_skills#update'
  get 'projects/:code/roles/:name/skills/edit', to: 'project_role_skills#edit', as: :project_role_skills_edit

  # GroupsController Routes
  get 'groups', to: 'groups#index', as: :groups
  post 'groups', to: 'groups#create'
  delete 'groups', to: 'groups#destroy'
  get 'groups/:name', to: 'groups#show', as: :group

  # GroupUsersController
  get 'groups/:name/users', to: 'group_users#index', as: :group_users
  post 'groups/:name/users', to: 'group_users#create'
  delete 'groups/:name/users', to: 'group_users#destroy'
  post 'groups/:name/users/search', to: 'group_users#search', as: :group_users_search

  # GroupPermissionsController
  get 'groups/:name/permissions', to: 'group_permissions#index', as: :group_permissions
  post 'groups/:name/permissions', to: 'group_permissions#create'
  delete 'groups/:name/permissions', to: 'group_permissions#destroy'

  # LocationsController Routes
  get 'locations', to: 'locations#index', as: :locations
  patch 'locations', to: 'locations#update'
  post 'locations', to: 'locations#create'
  delete 'locations', to: 'locations#destroy'
  get 'locations/:id/edit', to: 'locations#edit', as: :location

  # AdminPanelController Routes
  get 'admin', to: 'admin_panel#home', as: :admin_home

  # NotificationsController Routes
  get 'notifications', to: 'notifications#index', as: :notifications
  patch 'notifications', to: 'notifications#mark_as_read'
end
