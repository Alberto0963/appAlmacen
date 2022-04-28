class ClientSupplier < ApplicationRecord
    self.table_name = 'clientSupplier'

    validates :idSupplier, presence: true
    validates :idClient, presence: true

end
