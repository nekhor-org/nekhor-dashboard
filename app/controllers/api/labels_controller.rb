class Api::LabelsController < ApiController
  skip_before_action :authenticate_request
  def index
    @labels = Label.where(language_id: @language.id).last

    render json: @labels
  end
end
