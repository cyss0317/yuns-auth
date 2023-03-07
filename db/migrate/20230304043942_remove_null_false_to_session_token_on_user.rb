# frozen_string_literal: true

class RemoveNullFalseToSessionTokenOnUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :session_token, :string, null: true
  end
end
