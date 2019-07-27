Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :forecast do
        get '/forecast', to: 'forecast#index'
      end

      resources :forecast, only: [:index]
    end
  end
end
