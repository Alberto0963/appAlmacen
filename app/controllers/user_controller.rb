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

    private
        def user_params
            params.permit(:email,:password)
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
