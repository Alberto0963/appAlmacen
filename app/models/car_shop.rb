class CarShop < ApplicationRecord
    # self.quoted_table_name "carShop"
    # self . table_name =  final del "proyecto"
    # self.abstract_class = true
    self.table_name = 'carShop'

    validates :idProduct, presence: true
    validates :idClient, presence: true
    validates :qty, presence: true

end
