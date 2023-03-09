# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credential: true
    # credential: true makes it possible for headers to be passed
  end

  allow do
    origins 'http://localhost:5174'
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credential: true
    # credential: true makes it possible for headers to be passed
  end

  allow do
    origins 'http://localhost:5173'
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credential: true
    # credential: true makes it possible for headers to be passed
  end

  allow do
    origins 'yuns-auth.herokuapp.com'
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credential: true
    # credential: true makes it possible for headers to be passed
  end
end
