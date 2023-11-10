# frozen_string_literal: true

class Authorization
  def initialize(request)
    @token = request.headers[:Authorization]
  end

  def current_user
    @token = @token.present? ? @token.gsub("Bearer ", "") : ""
    @user ||= User.find_by(id: JsonWebToken.decode(@token)[:user_id]) if @token && JsonWebToken.decode(@token).present?
  end
end
