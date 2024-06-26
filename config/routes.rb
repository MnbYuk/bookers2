Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

  resources :books, only: [:index, :new, :show, :create, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :update, :index]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
