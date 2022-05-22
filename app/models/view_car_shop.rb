class ViewCarShop < ApplicationRecord
    self.table_name = 'viewCarShop'
    self.primary_key = 'carshopID'

    has_many :gallery, foreign_key: :idProduct

end
