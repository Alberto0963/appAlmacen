class Supplier < ApplicationRecord
    self.primary_key = 'id'

    validates :address, presence: true
    validates :email, presence: true
    validates :name, presence: true
    validates :phone, presence: true
    validates :userID, presence: true

    has_many :client_supplier, foreign_key: :idSupplier
    has_many :clients, through: :client_supplier
    # has_many :clients, foreign_key: :id, class_name: 'Client'
    # has_many :clientSupplier, foreign_key: :idSupplier
    # has_many :accessable_clients, through: :clientSupplier, source: :client_supplier
    
end
