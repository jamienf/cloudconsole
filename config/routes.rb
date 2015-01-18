Rails.application.routes.draw do
  root 'bands#index'
  devise_for :users

  resources :bands do
    resources :songs, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :band_members, only: [:create]
  end

  resources :song do
    resources :tracks, only: [:new, :create]
  end
end
