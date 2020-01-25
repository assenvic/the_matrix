module V1
  module Endpoints
    class Home < Grape::API
      include V1::Headers
      resources :home do
        get do
          home = { hello: 'world!' }
          present home, with: V1::Entities::HomeEntity
        end
      end
    end
  end
end