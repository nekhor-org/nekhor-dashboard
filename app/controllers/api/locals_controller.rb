class Api::LocalsController < ApiController
  skip_before_action :authenticate_request
  def index
    @locals = Local.all

    locals =  @locals.map do |local|
      local.local_names.where(language_id: @language.id).last
    end

    render json: locals
  end
end
