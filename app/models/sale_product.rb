class SaleProduct < ApplicationRecord
    self.table_name = 'salesProduct'


    validates :idProduct, presence: true
    validates :idSale, presence: true
end
