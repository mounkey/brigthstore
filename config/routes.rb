Rails.application.routes.draw do
  root to: 'pages#home'
  resources :categories, only: %i[new create edit update show destroy index] 

  resources :wears, only: %i[new create edit update show destroy index]

  resources :orders, only: %i[new update create destroy index]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
