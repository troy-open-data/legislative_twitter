module API
  class LegislationsController < BaseController
    before_action :set_legislation, only: :show

    def index
      @legislations = Legislation.all
      if params[:type].present?
        @legislations = @legislations.where(legislation_type: params[:type])
      end
    end

    def show
    end

    private

    def set_legislation
      @legislation = Legislation.find(params[:id])
    end
  end
end