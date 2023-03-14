# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
      @user = User
              .find_by(email: params['user']['email'])
              .try(:authenticate, params['user']['password'])
      @org = Organization.find_by(name: params['user']['org_name'])

      if @user&.org_id == @org.id
        session[:user_id] = @user.id
        @user[:logged_in] = true
        response_to :json
      else
        render json: { status: 401, message: 'wrong' }
      end
    end

    def logged_in
      if @current_user
        @current_user[:logged_in] = true
        response_to :json
      else
        render json: {
          logged_in: false
        }
      end
    end

    def logout
      reset_session
      render json: {
        status: 200, logged_out: true
      }
    end
  end
end
