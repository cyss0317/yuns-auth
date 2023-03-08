# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    render json: { status: "Server for Yuns-auth is currently running" }
  end
end
