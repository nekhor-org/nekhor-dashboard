class Api::LanguagesController < ApiController
  skip_before_action :authenticate_request
  def index
    @languages = Language.all

    render json: @languages
  end
end
