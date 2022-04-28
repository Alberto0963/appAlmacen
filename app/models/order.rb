class Order < ApplicationRecord
    self.table_name = 'orders'


    validates :idClient, presence: true
    validates :idSale, presence: true
end
