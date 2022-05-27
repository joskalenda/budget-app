Rails.application.routes.draw do
  devise_for :users
  # root to: "users#index"

  resources :categories do
    resources :entities
  end
    

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
