# common API helpers
module V1
  module Helpers
    extend Grape::API::Helpers

    def current_householder
    end

    def render_api_error(exception, http_code, message = nil)
      error!({},
        http_code,
        'X-Error' => I18n.t("api.error.#{error_code}",
          message: message || exception.message),
        'X-Error-Code' => error_code)
    end
  end
end
