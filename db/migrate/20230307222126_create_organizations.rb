# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :street_address
      t.string :state
      t.string :city
      t.string :phone

      t.timestamps
    end

    add_index :organizations, :name
  end
end
