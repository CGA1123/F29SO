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

  # GroupsController Routes
  get 'groups', to: 'groups#index', as: :groups
  post 'groups', to: 'groups#create'
  delete 'groups', to: 'groups#destroy'
  get 'groups/:name', to: 'groups#show', as: :group

  # GroupUsersController
  get 'groups/:name/users', to: 'group_users#index', as: :group_users
  post 'groups/:name/users', to: 'group_users#create'
  delete 'groups/:name/users', to: 'group_users#destroy'
  post 'groups/:name/search', to: 'group_users#search', as: :group_users_search

  # LocationsController Routes
  get 'locations', to: 'locations#index', as: :locations
  patch 'locations', to: 'locations#update'
  post 'locations', to: 'locations#create'
  delete 'locations', to: 'locations#destroy'
  get 'locations/:id/edit', to: 'locations#edit', as: :location
end
