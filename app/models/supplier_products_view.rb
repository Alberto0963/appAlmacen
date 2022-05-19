class SupplierProductsView < ApplicationRecord
    self.table_name = 'supplierProductView'
    self.primary_key = 'id'

    validates :idSupplier, presence: true

    validates :qty, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :id, presence: true
    validates :expirationDate, presence: true
    validates :descripcion, presence: true
    validates :created_at, presence: true
    validates :brand, presence: true
    validates :barcode, presence: true

    has_many :gallery, foreign_key: :idProduct
end
