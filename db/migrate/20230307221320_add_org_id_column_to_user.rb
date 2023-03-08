# frozen_string_literal: true

class AddOrgIdColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :org_id, :integer, null: false
    add_index :users, :org_id
  end
end
