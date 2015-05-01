module API
  module V1
    # Actions for the v1 Data API. This is the root API endpoint and contains
    # paths to the available APIs.
    class DataController < ApiVersionsController
      # GET /api.json
      def index
      end
    end
  end
end
