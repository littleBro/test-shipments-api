module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { errors: [e.message] }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid, StandardError do |e|
      render json: { errors: [e.message] }, status: :unprocessable_entity
    end
  end
end
