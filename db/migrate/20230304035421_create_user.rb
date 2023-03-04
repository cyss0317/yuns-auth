# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer :total_hours

      t.timestamps
    end
  end
end
