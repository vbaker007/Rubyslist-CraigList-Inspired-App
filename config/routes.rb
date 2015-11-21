Rails.application.routes.draw do
  resources :categories
  resources :subcategories
  resources :listings

  root 'categories#index'

  match '/help', to: 'pages#help', via: :get
  match '/scams', to: 'pages#scams', via: :get
  match '/tips', to: 'pages#tips', via: :get
  match '/terms', to: 'pages#terms', via: :get
  match 'privacy', to: 'pages#privacy', via: :get
  match '/about', to: 'pages#about', via: :get
  match '/contact', to: 'pages#contact', via: :get
end
