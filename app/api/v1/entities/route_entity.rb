# frozen_string_literal: true

module V1
  module Entities
    class RouteEntity < Grape::Entity
      expose :start_node, documentation: { type: String, desc: 'Start position.' }
      expose :end_node, documentation: { type: String, desc: 'End position.' }
      expose :passphrase, documentation: { type: String, desc: 'Unique identifier.' }
      expose :start_time, documentation: { type: String, desc: 'started at.' }
      expose :end_time, documentation: { type: String, desc: 'ended at.' }

      private

      def start_time
        convet_date_iso8601(object.start_time)
      end
      
      def end_time
        convet_date_iso8601(object.end_time)
      end
      
      def convet_date_iso8601(time)
        # another option we can use iso8601 method
        time.strftime('%Y-%m-%dT%H:%M:%S')
      end
    end
  end
end
