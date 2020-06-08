Rails.application.routes.draw do
  get "/bookmark", to: "bookmarks#index", as: "bookmark"
  devise_for :users
  root "posts#index"
  resources :posts, param: :slug
  resources :not_found, only: :index
  resources :categories, only: :show, param: :slug
  resources :tags, only: :show, param: :slug
  resources :searches, only: :index
  get "*path", controller: "application", action: "render_404"
end
