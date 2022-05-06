class SupplierController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_supplier, only: [:update, :show, :destroy]

    #GET /supplier  
    def index
        @supplier = Supplier.all 
        render json: @supplier, status: :ok
    end

    #GET /supplier/{email}
    def show
        render json: @supplier, status: :ok
    end

    #POST /supplier
    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            render json: @supplier, status: :ok
        else
            render json: { errors: @supplier.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /supplier/{id}
    def update
        if @supplier.update(supplier_params)
            render json: {message: "supplier updated", status: :ok}
        else
            render json: {errors: @supplier.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /supplier/{id}
    def destroy
        @supplier.destroy
    end

    def getMyClients
        clients = SupplierClientsView.where(idSupplier: params[:shopID])
        # clients = sup.clients
        render json: clients, status: :ok
    end
    
    def getMyProducts
        clients = SupplierProductsView.where(idSupplier: params[:shopID])
        # clients = sup.clients
        render json: clients, status: :ok
    end
    private
        def supplier_params
            params.permit(:address,:email, :name, :phone, :userID, :shopID)
        end

        def set_supplier
            @supplier = Supplier.find(params[:id])
        end
end
