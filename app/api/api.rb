# frozen_string_literal: true
class Api < Grape::API
  format :json

  mount V1::Base
  add_swagger_documentation format: :json,
                            api_version: 'v1',
                            base_path: "http://#{ENV['BIND_ON']}/api",
                            hide_documentation_path: true
end
