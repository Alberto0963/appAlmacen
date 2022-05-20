class ClientController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_client, only: [:update, :show, :destroy]

    #GET /client  
    def index
        @client = Client.all 
        render json: @client, status: :ok
    end

    #GET /client/{email}
    def show
        render json: @client, status: :ok
    end

    def mySuppliers
        # render json: @client, status: :ok
        sup = MySuppliersView.where( clientID:params[:clientID] )
        # clients = sup.clients
        render json: {data: sup}, status: :ok
    end




    #POST /client
    def create
        @client = Client.new(client_params)
        # if(params)
        if @client.save
            render json: @client, status: :ok
        else
            render json: { errors: @client.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /client/{id}
    def update
        if @client.update(client_params)
            render json: {message: "client updated", status: :ok}
        else
            render json: {errors: @client.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /client/{id}
    def destroy
        @client.destroy
    end

    private
        def client_params
            params.permit(:address,:email, :name, :phone, :userID,:supplierID, :clientID)
        end
#GET /client/ShopID
        def set_client
            @client = Client.find(params[:id])
        end
end
