class Api::CountriesController < ApiController
  skip_before_action :authenticate_request
  
  def index
    @q = Country.ransack(params[:q])
    @countries = @q.result(distinct: true).order(created_at: :desc)
    
    countries =  @countries.map do |country|
      country.country_names.where(language_id: @language.id).last
    end

    render json: countries
  end
end
