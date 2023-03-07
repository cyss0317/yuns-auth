# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://localhost:3000'
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credential: true
    # credential: true makes it possible for headers to be passed
  end
end
