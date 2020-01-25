# frozen_string_literal: true
module V1
  module Headers
    extend ActiveSupport::Concern

    included do
      class_eval do
        def self.desc(description, options = {}, &block)
          default_options = {
            headers: default_headers,
            http_codes: default_failures,
          }
          options = default_options.merge(options)
          super
        end

        def self.default_failures
          [
            [400, 'Bad Request'],
            [403, 'Access Denied'],
            [404, 'Not Found'],
            [422, 'Unprocessible Entity'],
          ]
        end

        def self.default_headers
          {
            'Accept': {
              type: 'String',
              description: 'Acceptable content type and API version',
              default: 'application/the_matrix-v1+json',
              required: true,
            },
            'household_token': {
              type: 'String',
              description: 'Authentication token for users',
              required: true,
            },
          }
        end
      end
    end
  end
end
