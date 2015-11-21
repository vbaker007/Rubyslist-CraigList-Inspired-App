Rails.application.routes.draw do
  resources :categories
  resources :subcategories
  resources :listings
  root 'categories#index'
  match '/help', to: 'pages#help', via: :get
end
