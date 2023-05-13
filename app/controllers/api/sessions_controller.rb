# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
      @user = User
              .find_by(email: params['user']['email'])
              .try(:authenticate, params['user']['password'])
      if !@user
        render json: ['No user was found matching'], status: 401
        return
      end

      @org = Organization.find_by(name: params['user']['org_name'])

      if @user&.org_id == @org.id
        session[:user_id] = @user.id
        # @user[:logged_in] = true
        # respond_to :json
        @html_content = render_to_string partial: 'api/users/user', locals: { user: @user }
        render json: { user: @html_content, logged_in: true }
      else
        render json: ['Invalid email or password'], status: 401
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
