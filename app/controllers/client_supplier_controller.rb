class ClientSupplierController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_clientSupplier, only: [:update, :show, :destroy]

    #GET /carShop  
    def index
        @clientSupplier = ClientSupplier.all 
        render json: @clientSupplier, status: :ok
    end

    #GET /carShop/{id}
    def show
        render json: @clientSupplier, status: :ok
    end

    #POST /carShop
    def create
        @clientSupplier = ClientSupplier.new(clientSupplier_params)
        if @clientSupplier.save
            render json: @clientSupplier, status: :ok
        else
            render json: { errors: @clientSupplier.errors.full_messages },
                    status: :unprocessable_entity
        end
    end     

    #PUT /carShop/{id}
    def update
        if @clientSupplier.update(clientSupplier_params)
            render json: {message: "car updated", status: :ok}
        else  
            render json: {errors: @clientSupplier.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /carShop/{id}
    def destroy
        @clientSupplier.destroy
    end

    private
        def clientSupplier_params
            params.permit(:idClient,:idSupplier)
        end

        def set_clientSupplier
            @clientSupplier = CarShop.find params[:id]
        end
end
