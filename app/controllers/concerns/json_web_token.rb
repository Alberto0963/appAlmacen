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
        # raise custom error to be handled by custom handler
        rescue JWT::ExpiredSignature, JWT::VerificationError => e
            raise ExceptionHandler::ExpiredSignature, e.message
        rescue  JWT::DecodeError, JWT::VerificationError => e
            raise ExceptionHandler::DecodeError, e.message
        
    end

end