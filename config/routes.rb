Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      post '/signup', to: 'registrations#create'
      resources :doctors, only: [:index, :create, :show, :destroy]
      resources :test, only: [:index]
      resources :appointments, only: [:index, :create, :show, :update, :destroy] do
        collection do
          get ':id', action: :show
        end
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
