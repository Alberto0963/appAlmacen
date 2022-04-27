class ApplicationController < ActionController::API
    include JsonWebToken

    before_action :authenticate_request
    # attr_reader :current_user
    
    private
    def authenticate_request
        header = request.headers["Authorization"]
        header = header.split(" ").last if header
        decoded = jwt_decode(header)
        
        @current_user = User.find(decoded[:user_id])
        # render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
    # def authenticate_request
    #     current_user = AuthorizeApiRequest.call(request.headers).result
    #     render json: { error: 'Not Authorized' }, status: 401 unless current_user
    #     end

end
