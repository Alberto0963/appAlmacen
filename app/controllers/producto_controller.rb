class ProductoController < ApplicationController


    skip_before_action :authenticate_request, only: [:create]
    before_action :set_product, only: [:update, :show, :destroy]

    #GET /product  
    def index
        @products = Product.all 
        render json: @products, status: :ok
    end

    #GET /product/{id}
    def show
        render json: @products, status: :ok
    end

    #POST /product
    def create
        @products = Product.new(product_params)
        if @products.save
            render json: @products, status: :ok
        else
            render json: { errors: @products.errors.full_messages },
                    status: :unprocessable_entity
        end
    end     

    #PUT /product/{id}
    def update
        if @products.update(product_params)
            render json: {message: "product updated", status: :ok}
        else  
            render json: {errors: @products.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /product/{id}
    def destroy
        @products.destroy
    end

    private
        def product_params
            params.permit(:idSupplier,:name, :price, :brand, :barcode, :expirationDate, :qty, :descripcion)
        end

        def set_product
            @products = Product.find params[:id]
        end

    


end
