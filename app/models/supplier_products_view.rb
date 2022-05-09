class SupplierProductsView < ApplicationRecord
    self.table_name = 'supplierProductView'

    validates :idSupplier, presence: true

    validates :qty, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :id, presence: true
    validates :id, presence: true
    validates :expirationDate, presence: true
    validates :descripcion, presence: true
    validates :created_at, presence: true
    validates :brand, presence: true
    validates :barcode, presence: true


end
