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
        render json: @user, status: :ok
    rescue 
        
        render json: ['error': 'no']
    end

    #POST /user
    def create
        @user = User.new(user_params)
        if @user.save
            render json: {data: @user}, status: :ok
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



    private
        def user_params
            params.permit(:email,:password)
        end

        def set_user
            @user = User.find_by(email: params[:email])
        end
end
