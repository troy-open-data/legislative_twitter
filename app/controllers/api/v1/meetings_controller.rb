module API::V1
  class MeetingsController < ApiVersionsController
    before_action :set_meeting, only: :show

    # GET /api/meetings.json
    def index
      @meetings = Meeting.all
    end

    # GET /api/meetings/1.json
    def show
    end

    private

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
  end
end