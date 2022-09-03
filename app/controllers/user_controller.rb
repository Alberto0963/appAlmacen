class UserController < ApplicationController 
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy]

    #GET /user  
    def index
        @users = User.all 
        render json: @users, status: :ok
    end

    #GET /user/{email}
    def show
        
        render json: {data: @user.as_json(include: [:client, :supplier])} , status: :ok
        
    rescue 
        
        render json: ['error': 'no']
    end

    #POST /user
    def create
        @user = User.new(user_params)
        if @user.save
            if params[:typ] == '0'
                supplier =  Supplier.new(supplier_params)
                supplier.userID = @user.id
                # supplier.name = "lll"
                # supplier.phone = '987999'
                supplier.save
                sendEmail(supplier)
            else
                client = Client.new(client_params)
                client.userID = @user.id

                client.save
                sendEmail(client)
            end
            render json: {data: @user, dd: params[:typ], supplierInfo: supplier, clientInfo: client}, status: :ok
        else
            render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #PUT /user/{email}
    def update
        unless @user.update(user_param)
            render json: {errors: @user.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /user/{email}
    def destroy
        @user.destroy
    end

    def sendEmail(user)
        # user = User.where(email: 'dr.house95@hotmail.com').first
        # UserMailer.with(user: user).weekly_summary.deliver_now
        d =  UserMailer.with(user: user).welcome_email_user.deliver
        # d = ''
        # render json: {data: user, email: d}, status: :ok
    end

    def sendEmails()
        user = User.where(email: params[:email]).first
        # UserMailer.with(user: user).weekly_summary.deliver_now
        d =  OrderSendMailer.with(user: user).order_send_email.deliver
        # d = ''
        render json: {data: user, email: d}, status: :ok
    end

    def sendnotification (tokens)
        fcm = FCM.new("AAAA5VkQXNc:APA91bFnpb6RPA6aIITXOZzVyGYfotrljZfIZQ4swWJ0stesHzxN44veoqCbGFifbzIuZVs3d6-PZVD95lAB2cBR2sgzDzhkTDW3-ZXD_OdGVPPsTZ3uEYvLYDVvFoQcQIQJ4OSn0v9R")

        # registration_ids= [token] # an array of one or more client registration tokens
        
        # See https://firebase.google.com/docs/cloud-messaging/http-server-ref for all available options.
        options = { "notification": {
                      "title": "Portugal vs. Denmark",
                      "body": "5 to 1"
                  }
        }

        token.each do |n|
            response = fcm.send(tokens[n].token, options)

        end
        response = fcm.send(registration_ids, options)
        render json: {data: response}, status: :ok


    end

    def registerToken

        existToken = Token.where(token: params[:token])

        if(existToken.empty?)
            token = Token.new(user_token_params)
            token.idUser = @current_user.id

            if(token.save)
                render json: {data: token}, status: :ok
            else
                render json: { errors: token.errors.full_messages },
                        status: :unprocessable_entity
            end
        else
            existToken.update(idUser:@current_user.id ,token: params[:token], device_type: params[:device_type])
            # existToken.idUser = 

            render json: { message: 'token actualizado', update: existToken },
                        status: :ok
        end

    
    end

    private
        def user_params
            params.permit(:email,:password)
        end

        def user_token_params
            params.permit(:token, :device_type)
        end

        def set_user
            @user = User.find_by(email: params[:email])
        end

        def supplier_params
            params.permit(:estado, :municipio,:localidad, :calle,:email, :name, :phone, :userID, :shopID, )
        end

        def client_params
            params.permit(:estado, :municipio,:localidad, :calle,:email, :name, :phone, :userID,:supplierID, :clientID,:nombre)
        end

        def typeUser_params
            params.permit(:typ)
        end
end
