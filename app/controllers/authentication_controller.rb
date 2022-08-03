class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    # POST /auth/login
    def login
        @user = User.find_by_email(params[:email]) 
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            # user = User.find_by(id: session[:user_id])

            render json: { token: token,user: @user.as_json(include: [:supplier,:client,:token])}, status: :ok
        else
            render json: { error: "unauthorized"}, status: :unauthorized
        end
    end


    def destroy
        # session.delete :id
        # # User.find(session[:id]).destroy
        # session[:id] = nil
        # @current_user = nil
        @user = nil
        render json: { message: "LogOut"}
        # head(:ok, status: :no_content)
    end

    
end
