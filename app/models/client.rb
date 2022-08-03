class Client < ApplicationRecord
    self.primary_key = 'id'

    validates :estado, presence: true
    validates :municipio, presence: true
    validates :localidad, presence: true
    validates :calle, presence: true

    validates :email, presence: true
    validates :name, presence: true
    # validates :phone, presence: true
    validates :userID, presence: true

    # belongs_to :holder, class_name: 'Supplier'
    # has_many :clientSupplier, foreign_key: :idCient
    # has_many :allowed_Clients, through: :clientSupplier, source: :client_supplier
    has_many :client_supplier, foreign_key: :idCient
    has_many :clients, through: :client_supplier, foreign_key: :idCient
    
    belongs_to :user, foreign_key: :userID, :primary_key => "id"


end
