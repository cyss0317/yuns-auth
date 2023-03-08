# frozen_string_literal: true

class Organization < ApplicationRecord
  validates_presence_of :name

  has_many :users,
           class_name: :User,
           foreign_key: :org_id
end
