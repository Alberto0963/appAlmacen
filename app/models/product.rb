class Product < ApplicationRecord

    validates :idSupplier, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :brand, presence: true
    validates :barcode, presence: true
    validates :expirationDate, presence: true
    validates :qty, presence: true
end
