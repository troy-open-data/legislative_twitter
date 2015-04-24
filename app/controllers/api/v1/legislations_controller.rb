module API::V1
  class LegislationsController < ApiVersionsController
    before_action :set_legislation, only: :show

    # @api {get} /legislations List legislation
    # @apiName get_legislations
    # @apiGroup legislations
    def index
      @legislations = Legislation.all
      if params[:type].present?
        @legislations = @legislations.where(legislation_type: params[:type])
      end
    end

    # @api {get} /legislation/:id Show legislation
    # @apiName GetLegislation
    # @apiGroup Legislation
    def show
    end

    private

    def set_legislation
      @legislation = Legislation.find(params[:id])
    end
  end
end