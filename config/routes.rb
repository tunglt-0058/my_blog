Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, param: :slug
  resources :not_found, only: :index
  resources :categories, only: :show, param: :slug
  get "*path", controller: "application", action: "render_404"
end
