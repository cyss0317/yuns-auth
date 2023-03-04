# frozen_string_literal: true

class AddSessionTokenAndPasswordDigestToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string, null: false
    add_column :users, :session_token, :string, null: false
    add_index :users, :id
    add_index :users, :session_token
    add_index :users, :email
  end
end
