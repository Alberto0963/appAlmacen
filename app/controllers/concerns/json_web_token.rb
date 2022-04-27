# frozen_string_literal: true

require 'jwt'
module JsonWebToken
    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.secret_key_base

    def jwt_encode(payload, exp = 5.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def jwt_decode(token)
        body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        HashWithIndifferentAccess.new body
    rescue
        render json: [error: 'sss']
    #     body = JWT.decode(token, SECRET_KEY)[0]
    #     HashWithIndifferentAccess.new body
    # rescue JWT::ExpiredSignature, JWT::VerificationError => e
    #     raise ExceptionHandler::ExpiredSignature, e.message
    # rescue JWT::DecodeError, JWT::VerificationError => e
    #     raise ExceptionHandler::DecodeError, e.message
    
        # decoded = JWT.decode(token,SECRET_KEY)
        # HashWithIndifferentAccess.new(JWT.decode(token,Rails.application.secrets.secret_key_base,false)[0])
        # HashWithIndifferentAccess.new decoded
    # rescue JWT::VerificationError, JWT::DecodeError
    #     render json: {error: 'lrll'}, status: :unauthorized
    end

end