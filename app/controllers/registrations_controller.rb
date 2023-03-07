# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      phone: params['user']['phone'],
      first_name: params['user']['first_name'],
      last_name: params['user']['last_name'],
      total_hours: params['user']['total_hours']
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user:
      }
    else
      render json: { status: 500 }
    end
  end
end
