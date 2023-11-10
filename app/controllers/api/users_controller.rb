class Api::UsersController < ApiController
  include ActionView::Helpers::NumberHelper
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]
  
  def update_user
    if current_user.update user_params
      render json: current_user, status: :ok
    else
      render json: { error: show_errors_json(current_user) }, status: 422
    end
  end

  def get_user
    # render json: { message: 'Acesso Negado' }, status: 401 and return  if current_user.active != 'active'
    render json: current_user
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      render json: {message: "Usuario criado com sucesso.", error: false}, status: :ok
    else
      render json: { error: show_errors_field_json(@user) }, status: 422
    end
  end

  def destroy
    if @user.destroy!
      render json: { message: "Usuário excluido com sucesso", error: false}, status: :ok
    else
      render json: { message: "Ocorreu um erro ", error: true }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
  
end


