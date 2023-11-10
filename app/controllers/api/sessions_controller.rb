class Api::SessionsController < ApiController
  skip_before_action :authenticate_request

  def signin
    p "LOGIN"
    print "LOGIN"
    auth_object = Authentication.new(login_params)

    p auth_object
    
    if auth_object.authenticate

      response.set_header('Authorization', auth_object.generate_token)
    
      render json: user_object(auth_object)#, status: 204

    else
    
      render json: {
        error: 'E-mail ou senha incorreta'
      }, status: :unauthorized
    
    end
  
  rescue StandardError => e
    p e
    render json: {
      error: 'Falha ao efetuar login'
    }, status: :not_found
  
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def user_object(auth_object)
    {
      message: 'Login efetuado com sucesso',
      token: auth_object.generate_token,
      id: auth_object.user.id,
      name: auth_object.user.name,
      email: auth_object.user.email,
    }
  end

end