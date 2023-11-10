# frozen_string_literal: true

class JsonWebToken
  JWT_SECRET = ENV['JWT_SECRET'] || "secret"

  # Gera o token jwt baseado nas informações enviadas
  def self.encode(payload, exp = 365.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  # Decodifica o token jwt e retorna as informações do usuario
  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    body = nil
    # raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::VerificationError => e
    body = nil
    # raise ExceptionHandler::DecodeError, e.message
  end
end
