module API
  module V1
    # Actions for the v1 Meetings API
    class MeetingsController < ApiVersionsController
      # GET /api/meetings.json
      def index
        @meetings = Meeting.all
      end

      # GET /api/meetings/1.json
      def show
        @meeting = Meeting.find(params[:id])
      end
    end
  end
end
