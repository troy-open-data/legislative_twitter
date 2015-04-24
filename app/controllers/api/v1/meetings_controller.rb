module API::V1
  class MeetingsController < ApiVersionsController
    before_action :set_meeting, only: [:show, :agenda, :minutes]

    # GET /api/meetings.json
    def index
      @meetings = Meeting.all
    end

    # GET /api/meetings/1.json
    def show
    end

    # GET /api/meetings/1/agenda.json
    def agenda
    end

    # GET /api/meetings/1/minutes.json
    def minutes
    end

    private

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
  end
end