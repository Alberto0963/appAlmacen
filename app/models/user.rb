# frozen_string_literal: true

class User < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true
    
end
