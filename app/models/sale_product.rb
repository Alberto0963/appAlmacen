class SaleProduct < ApplicationRecord
    self.table_name = 'salesProduct'


    validates :idProduct, presence: true
    validates :idSale, presence: true

    validates :qty, presence: true

    belongs_to :sale, foreign_key: :idSale, :primary_key => "id"
    belongs_to :product, foreign_key: :idProduct, :primary_key => "id"
    
end
