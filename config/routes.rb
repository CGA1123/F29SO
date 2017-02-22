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
  get 'projects/new', to: 'projects#new', as: :new_project
  get 'projects/:code', to: 'projects#show', as: :project
  patch 'projects/:code', to: 'projects#update'

  get 'projects/:code/edit', to: 'projects#edit', as: :edit_project

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
end
