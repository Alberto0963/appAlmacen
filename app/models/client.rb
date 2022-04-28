class Client < ApplicationRecord
    validates :address, presence: true
    validates :email, presence: true
    validates :name, presence: true
    validates :phone, presence: true
    validates :userID, presence: true
    
end
