class SuppliersClientView < ApplicationRecord
    self.table_name = 'suppliersClientView'

    validates :idSupplier, presence: true

    validates :addrress, presence: true
    validates :email, presence: true
    validates :name, presence: true
    validates :phone, presence: true
    validates :created_at, presence: true
    
end
