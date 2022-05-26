Rails.application.routes.draw do
  resources :categories
  resources :entities
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end


  # get 'category_entities/index'
  # get 'category_entities/show'
  # get 'category_entities/new'
  # get 'category_entities/edit'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'entities/index'
  # get 'entities/show'
  # get 'entities/new'
  # get 'entities/edit'
  # get 'users/index'
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "users#index"
end
