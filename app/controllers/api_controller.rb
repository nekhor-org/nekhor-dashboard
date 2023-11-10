class ApiController < ApplicationController
  attr_reader :current_user
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  before_action :authenticate_request
  skip_before_action :authenticate_user!
  
  def user_for_paper_trail
    current_user.try :id
  end

  def pagination_dict(collection)
    gap_pages = Array.new(collection.total_pages).map.with_index(1) { |_x, i| i }.to_s

    response.set_header('current_page', collection.current_page)
    response.set_header('next_page', collection.next_page)
    response.set_header('prev_page', collection.prev_page)
    response.set_header('gap_pages', gap_pages)
    response.set_header('total_pages', collection.total_pages)
    response.set_header('total_count', collection.total_count)
  end

  def show_errors_json(object)
    object.errors.map { |key, value| 
      "#{object.class.human_attribute_name(key.to_s.split('.').last.to_sym)}: #{value}" 
    }
  end
  
  def show_errors_field_json(object)
    object.errors.map { |key, value| 
      {
        model: key.to_s.split('.').first.to_sym,
        key: key.to_s.split('.').last.to_sym,
        value: value,
      }
    }
  end

  def authenticate_request
    auth = Authorization.new(request)
    @current_user = auth.current_user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: { error: 'Not Found' }, status: 404
  end
end