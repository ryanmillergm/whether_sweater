Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post '/api/v1/road_trip', to: 'api/v1/road_trip#create'
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :munchies, only: [:index]
      # resources :road_trip, only: [:create]
    end
  end

  # match "*path", to: "application#render_not_found", via: :all
end
