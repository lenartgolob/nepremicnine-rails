class JsonWebToken
    class << self
      def encode(payload, expiry = 24.hours.from_now)
        payload[:expiry] = expiry.to_i
        if Rails.env.production?
          secret_key_base = ENV['SECRET_KEY_BASE']
        else
          secret_key_base = Rails.application.secrets.secret_key_base
        end
        JWT.encode(payload, secret_key_base)
      end
      
      def decode(token)
        if Rails.env.production?
          secret_key_base = ENV['SECRET_KEY_BASE']
        else
          secret_key_base = Rails.application.secrets.secret_key_base
        end
        body = JWT.decode(token, secret_key_base)[0]
        HashWithIndifferentAccess.new body
      rescue
        nil
      end
    end
  end