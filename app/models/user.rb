# frozen_string_literal: true

class User < ApplicationRecord
    require "securerandom"
    self.primary_key = 'id'

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true

    has_one :supplier, foreign_key: :userID
    # has_one :client, foreign_key: :userID
    has_one :client, :foreign_key => "userID", 
                    :primary_key => "id"
    # has_many :token, foreign_key: :idUser, primary_key => "id"
    # belongs_to :token

    has_many :token, :foreign_key => "idUser", 
                        :primary_key => "id"
end
