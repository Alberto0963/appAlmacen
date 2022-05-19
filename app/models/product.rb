class Product < ApplicationRecord
    self.primary_key = 'id'

    validates :idSupplier, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :brand, presence: true
    validates :barcode, presence: true
    validates :expirationDate, presence: true
    validates :qty, presence: true

    validates :descripcion, presence: true
end
