class Token < ApplicationRecord
    # self.table_name = 'device_infos'

    self.primary_key = 'id'

    validates :idUser, presence: true
    validates :token, presence: true
    validates :device_type, presence: true

    belongs_to :user, foreign_key: :idUser, :primary_key => "id"

end
