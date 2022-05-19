class Gallery < ApplicationRecord
    self.table_name = 'Gallery'


    validates :idProduct, presence: true
    validates :image, presence: true

    belongs_to :supplierProductView
end
