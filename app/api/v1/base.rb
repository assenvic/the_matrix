module V1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'the_matrix'
    content_type :json, 'application/json'
    default_format :json

    helpers V1::Helpers

    include V1::RescueHelpers

    # Token Authentication
    before do
    end

    # Mount endpoints here
    mount V1::Endpoints::Home
  end
end