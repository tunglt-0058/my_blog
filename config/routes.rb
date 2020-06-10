Rails.application.routes.draw do
  get "/bookmark", to: "bookmarks#index", as: "bookmark"
  get "checked/:id", to: "bookmarks#checked", as: "checked"
  get "un_checked/:id", to: "bookmarks#un_checked", as: "un_checked"
  devise_for :users
  root "posts#index"
  resources :posts, param: :slug
  resources :not_found, only: :index
  resources :categories, only: :show, param: :slug
  resources :tags, only: :show, param: :slug
  resources :searches, only: :index
  get "*path", controller: "application", action: "render_404"
end
