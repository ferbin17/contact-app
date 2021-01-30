Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # api routes for messages#create
      resources :messages, only: [:create]
      
      # api routes for configurations#change_locale
      resources :configurations, only: [] do
        collection do
          post :change_locale
        end
      end
    end
  end

  # routes all unmatched routes to not found funciton of application controller
  get '*unmatched_route', to: 'application#not_found'

  # root
  root to: "messages#index"
end
