# frozen_string_literal: true

class User < ApplicationRecord
    require "securerandom"
    self.primary_key = 'id'

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true

    has_one :supplier, foreign_key: :userID
    has_one :client, foreign_key: :userID
    
end
