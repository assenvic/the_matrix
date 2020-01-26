module V1
  module Endpoints
    class Routes < Grape::API
      include V1::Headers
      resources :routes do
        desc 'Show route by passphrase', headers: default_headers
        params do
          requires :passphrase, type: String
        end
        get do
          route = Route.find_by!(passphrase: params[:passphrase])
          present route, with: V1::Entities::RouteEntity
        end

        desc 'Create passphrase', headers: default_headers
        params do
          requires :start_node, type: String, values: AlphanumericCode::CODES.values
          requires :end_node, type: String, values: AlphanumericCode::CODES.values
          requires :start_time, type: DateTime
          requires :end_time, type: DateTime
        end
        post do
          route = Route.create!(
            start_node: params[:start_node],
            end_node: params[:end_node],
            start_time: params[:start_time],
            end_time: params[:end_time]
          )

          present route, with: V1::Entities::RouteEntity
        end
      end
    end
  end
end
