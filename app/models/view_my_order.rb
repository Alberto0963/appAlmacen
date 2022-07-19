class ViewMyOrder < ApplicationRecord

    self.table_name = 'viewMyOrders'


    # validates :idProduct, presence: true
    # validates :idSale, presence: true
    has_many :ViewProductOrder, primary_key: "idSale", foreign_key: 'idSale'
    has_many :DireccionesEnvio, primary_key: "idSale", foreign_key: 'idSale'

end
