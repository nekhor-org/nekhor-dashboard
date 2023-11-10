class Api::CountriesController < ApiController
  skip_before_action :authenticate_request
  
  def index
    @countries = Country.all

    countries =  @countries.map do |country|
      country.country_names.where(language_id: @language.id).last
    end

    render json: countries
  end
end
