class SaleProductController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_saleProduct, only: [:update, :show, :destroy]

    #GET /saleProduct  
    def indexSale
        @saleProduct = SaleProduct.all 
        render json: @saleProduct, status: :ok
    end

    #GET /saleProduct/{id}
    def show
        render json: @saleProduct, status: :ok
    end

    #POST /saleProduct
    def create
        @saleProduct = SaleProduct.new(saleProduct_params)
        if @saleProduct.save
            render json: @saleProduct, status: :ok
        else
            render json: { errors: @saleProduct.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /saleProduct/{id}
    def update
        if @saleProduct.update(saleProduct_params)
            render json: {message: "sale updated", status: :ok}
        else
            render json: {errors: @saleProduct.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /saleProduct/{id}
    def destroy
        @saleProduct.destroy
    end
    
    private
        def saleProduct_params
            params.permit(:idProduct,:idSale,:qty)
        end

        def set_sale
            @saleProduct = SaleProduct.find(params[:id])
        end
end
