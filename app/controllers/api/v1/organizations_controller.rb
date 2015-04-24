module API::V1
  class OrganizationsController < ApiVersionsController
    before_action :set_organization, only: :show

    # GET /api/organizations.json
    def index
      @organizations = Organization.all
    end

    # GET /api/organizations/1.json
    def show
    end

    private

    def set_organization
      @organization = Organization.find(params[:id])
    end
  end
end