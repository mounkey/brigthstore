Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :categories 

  resources :wears

  resources :orders do
    resources :order_items, only: %i[new create update destroy]
    get "/order_id/:id", to: "order_items#suma", as: :suma
  end

  resources :order_deatils, only: %i[new create update destroy]

  devise_for :users

  get "/pages/contact", to: "pages#contact", as: :pages_contact
  get "/pages/who", to:"pages#who", as: :pages_who
  get "/pages/help", to:"pages#help", as: :pages_help

  # get "wears/search/:search", to:"wears#search", as: :wears_search
  get "search", to:"wears#search", as: :search
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
