Rails.application.routes.draw do
  root 'bands#index'
  devise_for :users

  resources :bands do
    resources :songs, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :bandmembers, only: [:new]
  end

  resources :song do
    resources :tracks, only: [:new, :create, :destroy]
  end
end
