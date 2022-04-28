class Sale < ApplicationRecord
    self.table_name = 'sales'


    validates :idClient, presence: true
    validates :idSupplier, presence: true
end
