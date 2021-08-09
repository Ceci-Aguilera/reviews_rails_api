Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        get "categories", to: "categories#index"
        get "category/:id", to: "categories#show"
      end
    end

end
