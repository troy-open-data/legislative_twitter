module API::V1
  class BillsController < ApiVersionsController
    before_action :set_bill, only: :show

    # @api {get} /Bills List bill
    # @apiName get_bills
    # @apiGroup Bills
    def index
      @bills = Bill.all
      if params[:type].present?
        @bills = @bills.where(legislation_type: params[:type])
      end
    end

    # @api {get} /bill/:id Show bill
    # @apiName get_bill
    # @apiGroup Bills
    def show
    end

    private

    def set_bill
      @bill = Bill.find(params[:id])
    end
  end
end