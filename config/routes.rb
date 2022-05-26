Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :categories, only: [:show, :index, :update, :new, :edit] do
    resources :entities
  end
    

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
end
