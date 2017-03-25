Rails.application.routes.draw do
  #get 'body_mass/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'body_mass#index'
  resources :body_mass
end
