class ApplicationController < ActionController::Base
  before_action :set_language
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? # special definition in devise
      'login'
    else
      'application'
    end
  end

  def set_language
    @language = params[:language_id].present? ? Language.find(params[:language_id]) : Language.first
  end
end
