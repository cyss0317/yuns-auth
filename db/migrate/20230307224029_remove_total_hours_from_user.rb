# frozen_string_literal: true

class RemoveTotalHoursFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :total_hours
  end
end
