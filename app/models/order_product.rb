class OrderProduct < ApplicationRecord
    self.table_name = 'orderProduct'


    validates :idProduct, presence: true
    validates :idSale, presence: true
end
