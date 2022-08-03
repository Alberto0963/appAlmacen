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
        # client = Supplier.find_by(id: params[:idClient])
  
        if @clientSupplier.save
            tokens = @clientSupplier.supplier.user.as_json(include: [:token])
            a = sendnotification(tokens['token'], 'Nuevo Cliente', 'El Usuario ' + @clientSupplier.client.name + ' solicita acceso a tu catalogo')

            render json: {data: @clientSupplier, notification: a}, status: :ok
        else
            render json: { errors: @clientSupplier.errors.full_messages },
                    status: :unprocessable_entity
        end
    end     

    #PUT /carShop/{id}
    def update
        if @clientSupplier.update(clientSupplier_params)
            tokens = @clientSupplier.client.user.as_json(include: [:token])
            
            a = sendnotification(tokens['token'], 'Acceso a Catalogo', @clientSupplier.supplier.name + ' te dio acceso a su catalogo')
            render json: {message: "Client updated", m: @clientSupplier, notification: a}, status: :ok
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
            params.permit(:idClient,:idSupplier, :id,:status)
        end

        def set_clientSupplier
            @clientSupplier = ClientSupplier.find params[:id]
        end

        def sendnotification (tokens,title,body)
            fcm = FCM.new("AAAA5VkQXNc:APA91bFnpb6RPA6aIITXOZzVyGYfotrljZfIZQ4swWJ0stesHzxN44veoqCbGFifbzIuZVs3d6-PZVD95lAB2cBR2sgzDzhkTDW3-ZXD_OdGVPPsTZ3uEYvLYDVvFoQcQIQJ4OSn0v9R")
    
            registration_ids= [] # an array of one or more client registration tokens
            
            # See https://firebase.google.com/docs/cloud-messaging/http-server-ref for all available options.
            options = { "notification": {
                          "title": title,
                          "body": body
                      }
            }
            
            tokens.each do |n|
                # return n['token']
                # response = fcm.send(n['token'], options)
                 registration_ids.push n['token']
            end
            response = fcm.send(registration_ids, options)
            # render json: {data: response}, status: :ok
    
    
        end
end
