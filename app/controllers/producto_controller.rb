class ProductoController < ApplicationController


    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy]

    #GET /user  
    def index
        @products = Product.all 
        render json: @products, status: :ok
    end

    #GET /user/{email}
    def show
        render json: @products, status: :ok
    end

    #POST /user
    def create
        @products = Product.new(user_params)
        if @products.save
            render json: @products, status: :ok
        else
            render json: { errors: @products.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /user/{email}
    def update
        unless @products.update(user_param)
            render json: {errors: @products.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /user/{email}
    def destroy
        @products.destroy
    end

    private
        def product_params
            params.permit(:idSupplier,:name, :price, :band, :barcode, :expirationDate, :qty)
        end

        def set_product
            @products = Products.find(params[:id])
        end

    


end
