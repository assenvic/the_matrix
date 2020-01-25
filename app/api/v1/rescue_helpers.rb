# frozen_string_literal: true
module V1
  module RescueHelpers
    extend ActiveSupport::Concern

    included do
      rescue_from Grape::Exceptions::ValidationErrors do |exception|
        render_api_error(exception, 400)
      end

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render_api_error(exception, 404, message)
      end

      rescue_from ActiveRecord::RecordInvalid do |exception|
        render_api_error(exception, 422)
      end

      rescue_from ActiveRecord::Rollback do |exception|
        render_api_error(exception, 422)
      end

      rescue_from :all do |exception|
        render_api_error(exception, 500, 'Something went wrong!')
      end
    end
  end
end
