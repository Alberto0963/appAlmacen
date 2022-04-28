class OrderController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_order, only: [:update, :show, :destroy]

    #GET /order  
    def index
        @order = Order.all 
        render json: @order, status: :ok
    end

    #GET /order/{id}
    def show
        render json: @order, status: :ok
    end

    #POST /order
    def create
        @order = Order.new(order_params)
        if @order.save
            render json: @order, status: :ok
        else
            render json: { errors: @order.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /order/{id}
    def update
        if @order.update(order_params)
            render json: {message: "order updated", status: :ok}
        else
            render json: {errors: @order.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /order/{id}
    def destroy
        @order.destroy
    end

    private
        def order_params
            params.permit(:idProduct,:idSale)
        end

        def set_order
            @order = Order.find(params[:id])
        end
end
