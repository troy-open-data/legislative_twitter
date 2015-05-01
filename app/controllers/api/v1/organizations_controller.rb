module API
  module V1
    # Actions for the v1 Organizations API
    class OrganizationsController < ApiVersionsController
      # GET /api/organizations.json
      def index
        @organizations = Organization.all
      end

      # GET /api/organizations/1.json
      def show
        @organization = Organization.find(params[:id])
      end
    end
  end
end
