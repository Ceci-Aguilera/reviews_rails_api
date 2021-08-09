class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none

  # Rails.application.config.middleware.insert_before 0, Rack::Cors do
  #   allow do
  #     origins '*'
  #
  #     resource '*',
  #       headers: :any,
  #       methods: [:get, :post, :put, :patch, :delete, :options, :head]
  #   end
  # end

end
