Rails.application.routes.draw do
  resources :workdays, :punches, :lunch_times

  root :to => 'home#index'
  get 'home/index'

  controller :api_token do
    get '/api_token', action: :index, as: :user_api_token
  end

  namespace :api do
    controller :punches do
      get  'punches', action: :index,  as: :punch
      post 'punches', action: :create
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
end
