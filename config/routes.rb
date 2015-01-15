Rails.application.routes.draw do
  root 'bands#index'
  devise_for :users

  resources :bands do
    resources :songs, only: [:new, :create, :show]
  end

end
