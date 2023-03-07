class AddIndexToOrgName < ActiveRecord::Migration[7.0]
  def change
    add_index :organizations, :name
  end
end
