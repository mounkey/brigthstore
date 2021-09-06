Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :categories 

  resources :wears

  resources :orders, only: %i[new update create destroy index]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
