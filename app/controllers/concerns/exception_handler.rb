module ExceptionHandler
    extend ActiveSupport::Concern
    class DecodeError < StandardError; end
    
    class ExpiredSignature < StandardError; end
    
    included do
      
        rescue ExceptionHandler::DecodeError do |_error|
        render json: {
          message: "Access denied!. Invalid token supplied."
        }, status: :unauthorized
      end
      
      rescue ExceptionHandler::ExpiredSignature do |_error|
        render json: {
          message: "Access denied!. Token has expired."
        }, status: :unauthorized
      end
    end
end