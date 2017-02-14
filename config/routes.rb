require 'sidekiq/web'

Rails.application.routes.draw do
  root 'repositories#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth',
    sessions: 'sessions',
  }
  resources :repositories do
    resources :executables
  end
  resources :workers
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
