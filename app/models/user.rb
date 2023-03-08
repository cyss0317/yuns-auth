# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  belongs_to :organization,
             class_name: :Organization,
             foreign_key: :org_id,
             optional: true
end
