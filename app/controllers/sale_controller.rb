class SaleController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_sale, only: [:update, :show, :destroy]

    #GET /sale  
    def index
        @sale = Sale.all 
        render json: @sale, status: :ok
    end

    #GET /sale/{id}
    def show
        render json: @sale, status: :ok
    end

    #POST /sale
    def create
        @sale = Sale.new(sale_params)
        if @sale.save
            render json: @sale, status: :ok
        else
            render json: { errors: @sale.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /sale/{id}
    def update
        if @sale.update(sale_params)
            render json: {message: "sale updated", status: :ok}
        else
            render json: {errors: @sale.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /sale/{id}
    def destroy
        @sale.destroy
    end

    private
        def sale_params
            params.permit(:idProduct,:idSupplier)
        end

        def set_sale
            @sale = Sale.find(params[:id])
        end
end
