Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index, :show], param: :slug
  resources :not_found, only: :index
end
