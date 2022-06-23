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

    def showMyInfo
        info = Client.where( id: params[:clientID] )

        render json: {'data':info}, status: :ok
    end

    def mySuppliers
        # render json: @client, status: :ok
        sup = MySuppliersView.where( clientID:params[:clientID] )
        # clients = sup.clients
        render json: {data: sup}, status: :ok
    end

    def getMyOrders
        # render json: @client, status: :ok
        sup = ViewMyOrder.where( idClient: params[:clientID], idSupplier: params[:supplierID] )
        
    

        if(params[:typ] == '0')
            stats = SaleStatus.where(id: 4)
        else
            stats = SaleStatus.where(id: 5)
        end

        # clients = sup.cli      
        render json: { data: sup.as_json(include: [:ViewProductOrder]),status: stats}, status: :ok
    end

    def getCarShop
        # render json: @client, status: :ok
        sup = ViewCarShop.where( idClient: params[:clientID], idSupplier: params[:supplierID] )
        # clients = sup.cli     clients.as_json(include: [:gallery])}, 
        render json: {data: sup.as_json(include: [:gallery])}, status: :ok
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
            params.permit(:address,:email, :name, :phone, :userID,:supplierID, :clientID, :typ)
        end
#GET /client/ShopID
        def set_client
            @client = Client.find_by(id: params[:id])
        end
end
