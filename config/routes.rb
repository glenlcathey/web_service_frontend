Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  post 'pages#home', to: 'pages#generate_data'
  patch 'pages#home', to: 'pages#stop_generating_data'
  delete 'pages#home', to: 'pages#delete_data'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
