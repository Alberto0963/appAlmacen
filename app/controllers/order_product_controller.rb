class OrderProductController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_orderProduct, only: [:update, :show, :destroy]

    #GET /orderProduct  
    def index
        @orderProduct = OrderProduct.all 
        render json: @orderProduct, status: :ok
    end

    #GET /orderProduct/{id}
    def show
        render json: @orderProduct, status: :ok
    end

    #POST /orderProduct
    def create
        @orderProduct = OrderProduct.new(orderProduct_params)
        if @orderProduct.save
            render json: @orderProduct, status: :ok
        else
            render json: { errors: @orderProduct.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /orderProduct/{id}
    def update
        if @orderProduct.update(orderProduct_params)
            render json: {message: "orderProduct updated", status: :ok}
        else
            render json: {errors: @orderProduct.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /orderProduct/{id}
    def destroy
        @orderProduct.destroy
    end

    private
        def orderProduct_params
            params.permit(:idProduct,:idSale)
        end

        def set_orderProduct
            @orderProduct = OrderProduct.find(params[:id])
        end
end
