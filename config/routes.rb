Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:create]
      
      resources :configurations, only: [] do
        collection do
          post :change_locale
        end
      end
    end
  end

  root to: "messages#index"
end
