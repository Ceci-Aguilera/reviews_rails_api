Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        get "check_auth", to: "sessions#show"
        delete "sign_out", to: "sessions#destroy"
      end
        get "categories", to: "categories#index"
        get "category/:id", to: "categories#show"
        get "technologies", to: "technologies#index"
    end
  end
end
