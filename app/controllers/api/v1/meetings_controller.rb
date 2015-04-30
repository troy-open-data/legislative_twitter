module API::V1
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