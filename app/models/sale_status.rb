class SaleStatus < ApplicationRecord
    self.table_name = 'Status'
    self.inheritance_column = :foo
    # attr_accessible :type
end
