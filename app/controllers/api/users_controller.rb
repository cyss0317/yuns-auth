# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def create
      @user = User.create!(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        phone: params['user']['phone'],
        first_name: params['user']['first_name'],
        last_name: params['user']['last_name'],
        org_id: Organization.find_by(name: params['user']['org_name']).id
      )

      if @user
        session[:user_id] = @user.id
        # render json: {
        #   status: :created,
        #   user: @user
        # }
        respond_to :json
      else
        flash[:errors] = @user.errors.full_messages
        render json: { status: 500 }
      end
    end

    def update
      @user = User.find(params[:id])
      if @user&.update(user_params)
        respond_to :json
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :phone, :first_name, :last_name, :org_name)
    end
  end
end
