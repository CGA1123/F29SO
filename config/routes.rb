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

  # InvitationsController Routes
  get 'invitations/new', to: 'invitations#new', as: :new_invitation
  get 'invitations', to: 'invitations#index', as: :invitations
  post 'invitations', to: 'invitations#create'
  delete 'invitations/:id', to: 'invitations#destroy', as: :invitation
  get 'invitations/accept', to: 'invitations#accept', as: :accept_invitation
  post 'invitations/accept', to: 'invitations#create_user'

  # ProjectsController Routes
  get 'projects', to: 'projects#index', as: :projects
  post 'projects', to: 'projects#create'
  delete 'projects', to: 'projects#destroy'
  patch 'projects', to: 'projects#update'
  get 'projects/new', to: 'projects#new', as: :new_project
  get 'projects/:code', to: 'projects#show', as: :project
  get 'projects/:code/edit', to: 'projects#edit', as: :edit_project

  # ProjectTypesController
  get 'project_types', to: 'project_types#index', as: :project_types
  post 'project_types', to: 'project_types#create', as: :project_type
  delete 'project_types', to: 'project_types#destroy'
  patch 'project_types', to: 'project_types#update'
  get 'project_types/:id/edit', to: 'project_types#edit', as: :edit_project_type

  # ProjectGroupsController Routes
  get 'projects/:code/groups', to: 'project_groups#index', as: :project_groups
  post 'projects/:code/groups', to: 'project_groups#create'
  get 'projects/:code/groups/new', to: 'project_group#new', as: :new_project_group
  get 'projects/:code/groups/:name', to: 'project_group#show', as: :project_group

  # ProjectGroupsController Routes
  get 'projects/:code/groups', to: 'project_groups#index', as: :project_groups
  post 'projects/:code/groups', to: 'project_groups#create'
  get 'projects/:code/groups/new', to: 'project_groups#new', as: :new_project_group
  get 'projects/:code/groups/:name', to: 'project_groups#show', as: :project_group
  post 'projects/:code/groups/:name/users/search', to: 'project_group_users#search', as: :project_group_users_search
  delete 'projects/:code/groups', to: 'project_groups#destroy'

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
