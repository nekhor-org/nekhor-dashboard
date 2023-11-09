class ApplicationController < ActionController::Base
  before_action :set_language

  def set_language
    @language = params[:language_id].present? ? Language.find(params[:language_id]) : Language.first
  end
end
