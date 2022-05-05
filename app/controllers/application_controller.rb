class ApplicationController < ActionController::API
    include JsonWebToken 

    before_action :authenticate_request
    # attr_reader :current_user
    
    private
    # def authenticate_request
    #     header = request.headers["Authorization"]
    #     header = header.split(" ").last if header
    #     decoded = jwt_decode(header)
   
    #     @current_user = User.find(decoded[:user_id])        
    #     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    # end

    def not_found
        render json: { error: 'not_found' }
    end


    private
    def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
        @decoded = jwt_decode(header)
        # return @decoded
        @current_user = User.find_by_id(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
    end
    end

end
