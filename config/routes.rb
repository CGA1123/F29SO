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

  get 'profile/:id', to: 'profiles#show', as: :profile
  patch 'profile', to: 'profiles#update'
  get 'profile/:id/edit', to: 'profiles#edit', as: :edit_profile

  # Invitation routes
  get 'invitations/new', to: 'invitations#new', as: :new_invitation
  get 'invitations', to: 'invitations#index', as: :invitations
  post 'invitations', to: 'invitations#create'

  get 'invitations/accept', to: 'invitations#accept', as: :accept_invitation
end
