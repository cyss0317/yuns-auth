# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    render json: { status: 200, message: 'Server for Yuns-auth is currently running',
                   routes: ['api/users', 'api/organizations'] }
  end
end
