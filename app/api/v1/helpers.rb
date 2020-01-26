# common API helpers
module V1
  module Helpers
    extend Grape::API::Helpers

    def render_api_error(exception, http_code, message = nil)
      error!({},
        http_code,
        'X-Error' => I18n.t("api.error.#{http_code}",
          message: message || exception.message),
        'X-Error-Code' => http_code)
    end
  end
end
