Rails.application.routes.draw do
  resources :workdays, :punches, :lunch_times

  root :to => 'home#index'
  get 'home/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
end
