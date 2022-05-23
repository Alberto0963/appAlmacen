class CarShopController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_carShop, only: [:update, :show, :destroy]

    #GET /carShop  
    def index
        @carShop = CarShop.all 
        render json: @carshop, status: :ok
    end

    #GET /carShop/{id}
    def show
        render json: @carShop, status: :ok
    end

    #POST /carShop
    def create
        @carShop = CarShop.new(carShop_params)
        if @carShop.save
            render json: @carShop, status: :ok
        else
            render json: { errors: @carShop.errors.full_messages },
                    status: :unprocessable_entity
        end
    end     

    #PUT /carShop/{id}
    def update
        if @carShop.update(carShop_params)
            render json: {message: "car updated", status: :ok}
        else  
            render json: {errors: @carShop.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /carShop/{id}
    def destroy
        @carShop.destroy
    end

    private
        def carShop_params
            params.permit(:idClient,:idProduct, :qty, :idSupplier)
        end

        def set_carShop
            @carShop = CarShop.find params[:id]
        end
end
