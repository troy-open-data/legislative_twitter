# Meetings actions
class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.includes(:organization).order('date_and_time DESC')
    @grouped_meetings = @meetings.group_by(&:organization)
  end

  # GET /meetings/1
  def show
  end

  # GET /meetings/1/start_meeting
  def start_meeting
    @meeting = Meeting.includes(motions: [:sponsors,
                                          bill: [:recitals, :sections],
                                          votes: :person],
                                organization: :people).find(params[:id])

    @meeting.motions.each { |m| m.roll_calls.build if m.roll_calls.empty? }
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    item_titles = ['Pledge of Allegiance', 'Roll Call', 'Good News Agenda']
    item_titles.each { |title| @meeting.meeting_items.build(title: title) }
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_path(@meeting), notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #   only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:organization_id, :date_and_time, :location,
                                    bill_ids: [],
                                    person_ids: [],
                                    meeting_items_attributes: [:title,
                                                               :text,
                                                               :id,
                                                               :_destroy],
                                    motions_attributes: [:notes,
                                                         :bill_id,
                                                         :meeting_id,
                                                         :id,
                                                         :_destroy,
                                                         sponsor_ids:  [],
                                                         roll_calls_attributes: [:type,
                                                                                 :notes,
                                                                                 :id,
                                                                                 :passed,
                                                                                 :_destroy,
                                                                                 votes_attributes: [:id,
                                                                                                    :person_id,
                                                                                                    :vote,
                                                                                                    :_destroy]]])
  end
end
