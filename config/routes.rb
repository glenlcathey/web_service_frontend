Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  post '/', to: 'pages#generate_data'
  patch '/', to: 'pages#stop_generating_data'
  delete '/', to: 'pages#delete_data'
  
  #resources :pages do
  #  collection do
  #    get :generate_data
  #  end
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
