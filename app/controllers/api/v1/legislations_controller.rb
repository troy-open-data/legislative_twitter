module API::V1
  class LegislationsController < ApiVersionsController
    before_action :set_legislation, only: :show

    # GET /api/legislations.json
    def index
      @legislations = Legislation.all
      if params[:type].present?
        @legislations = @legislations.where(legislation_type: params[:type])
      end
    end

    # GET /api/legislations/1.json
    def show
    end

    private

    def set_legislation
      @legislation = Legislation.find(params[:id])
    end
  end
end