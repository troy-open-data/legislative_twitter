module API
  module V1
    # Actions for the v1 Bills API
    class BillsController < ApiVersionsController
      # GET /api/bills.json
      def index
        @bills = case
                 when params[:type].present?
                   Bill.where(legislation_type: params[:type])
                 else
                   Bill.all
                 end
      end

      # GET /api/bills/1.json
      def show
        @bill = Bill.find(params[:id])
      end
    end
  end
end
