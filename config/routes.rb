require 'sidekiq/web'

Rails.application.routes.draw do
  root 'libmemfs#index', constraints: { subdomain: 'libmemfs' }
  root 'projects#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  resources :projects do
    resources :executables
  end
  resources :helps
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
