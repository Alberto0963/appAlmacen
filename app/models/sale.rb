class Sale < ApplicationRecord
    attr_accessor :current_user

    self.table_name = 'sales'


    validates :idClient, presence: true
    validates :idSupplier, presence: true
end
