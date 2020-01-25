module V1
  module Endpoints
    class Home < Grape::API
      include V1::Headers
      resources :home do
<<<<<<< HEAD
        desc 'Application health check.'
=======
>>>>>>> In the beginning, there was nothing. And God said, 'Let there be matrix'.
        get do
          home = { hello: 'world!' }
          present home, with: V1::Entities::HomeEntity
        end
      end
    end
  end
end