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
            if (params[:codigoPostal] != nil)
                dir = DireccionesEnvio.new(saleDireccionEnvio_params)
                dir.idSale = @sale.id
                dir.save
            end
           client = Client.find_by(id: params[:idClient])
           supplier = Supplier.find_by(id: params[:idSupplier])

        #    tokens  = User.find_by(id: client.userID)
            tokens = supplier.user.as_json(include: [:token])
            a = sendnotification(tokens['token'], 'Nueva Venta', 'Compra Realizada por ' + client.name)

            sendEmailSale(@sale.id,dir)

            render json: {sale: @sale, direccion: dir, curent: tokens['token'], v: a}, status: :ok
        else
            render json: { errors: @sale.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /sale/{id}
    def update
        if @sale.update(sale_params)
            if params[:fechaEntrega] != nil
                dir = DireccionesEnvio.find_by(idSale: @sale.id)
                ShipperEmailMailer.with(sale: @sale,dir: dir).shipper_email.deliver_later(wait: 1.minutes)
            else

            end

            render json: {message: "sale updated" },status: :ok
        else
            render json: {errors: @sale.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    def sendEmailSale(saleid, dir)
        sale = Sale.where(id: saleid).first
        # UserMailer.with(user: user).weekly_summary.deliver_now
        d =  OrderSendMailer.with(sale: sale, dir: dir).order_send_email.deliver_later(wait: 1.minutes)
        # d = ''
        # render json: {data: sale.id, email: 'd'}, status: :ok
    end

    #DELETE /sale/{id}
    def destroy
        @sale.destroy
    end

    private
        def sale_params
            params.permit(:id,:idClient,:idSupplier, :status,:fechaEntrega, :tipoPago,:tipoEnvio,)
        end

        def saleDireccionEnvio_params
            params.permit(:codigoPostal, :estado, :municipio, :localidad, :calle)
        end

        def set_sale
            @sale = Sale.find(params[:id])
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
