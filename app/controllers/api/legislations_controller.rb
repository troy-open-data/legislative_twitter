module API
  class LegislationsController < BaseController
    before_action :set_legislation, only: :show

    def index
      legislations = Legislation.all
      if params[:type].present?
        legislations = legislations.where(legislation_type: params[:type])
      end
      render json: legislations, status: :ok
    end

    def show
      render json: @legislation, status: :ok
    end

    private

    def set_legislation
      @legislation = Legislation.find(params[:id])
    end
  end
end