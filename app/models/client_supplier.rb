class ClientSupplier < ApplicationRecord
    self.table_name = 'clientSupplier'
    self.primary_key = 'id'

    validates :idSupplier, presence: true
    validates :idClient, presence: true

    # belongs_to :user 
    # belongs_to :book

    belongs_to :supplier, class_name: 'Supplier', optional: true
    belongs_to :client, class_name: 'Client', optional: true
end
