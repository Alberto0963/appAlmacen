class Sale < ApplicationRecord

    self.table_name = 'sales'


    validates :idClient, presence: true
    validates :idSupplier, presence: true

    has_many :sale_product, :foreign_key => "idSale", :primary_key => "id"

    has_many :products, :foreign_key => "idProduct", :primary_key => "id", through: :sale_product
    belongs_to :client, foreign_key: :idClient, :primary_key => "id"

end
