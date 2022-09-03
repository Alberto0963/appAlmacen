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

    has_many :sale_product, :foreign_key => "idProduct", :primary_key => "id"
    has_many :sale, :foreign_key => "idSale", :primary_key => "id", through: :sale_product

end
