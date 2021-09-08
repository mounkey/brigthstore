Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :categories 

  resources :wears

  resources :orders do
    resources :order_items, only: %i[new create update destroy]
  end

  devise_for :users

  get "/pages/contact", to: "pages#contact", as: :pages_contact
  get "/pages/who", to:"pages#who", as: :pages_who
  get "/pages/help", to:"pages#help", as: :pages_help


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
