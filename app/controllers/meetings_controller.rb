class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy,
                                     :toggle_agenda, :toggle_minutes]
  before_action :set_meeting_with_folios, only: [:agenda, :minutes, :start_meeting]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.includes(:organization).order('date_and_time DESC')
    @grouped_meetings = @meetings.group_by{|meeting| meeting.organization}
  end

  # GET /meetings/1
  def show
  end

  # GET /meetings/1/agenda
  # GET /meetings/1/agenda.pdf
  def agenda
    default_attachments = { bill: true, attachments: true }
    @attach = params[:attach] || default_attachments
  end

  # GET /toggle_agenda/1.js
  def toggle_agenda
    @meeting.toggle_approval :agenda
    respond_to do |format|
      format.js
    end
  end

  # GET /toggle_minutes/1.js
  def toggle_minutes
    @meeting.toggle_approval :minutes
    respond_to do |format|
      format.js
    end
  end

  # GET /meetings/1/minutes
  # GET /meetings/1/minutes.pdf
  def minutes
  end

  # GET /meetings/1/start_meeting
  def start_meeting
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
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

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting_with_folios
    @meeting = Meeting.includes(folios: :legislation).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:organization_id, :date_and_time, :location,
                                    bill_ids: [],
                                    folios_attributes: [:sponsor,
                                                        :vote,
                                                        :notes,
                                                        :bill_id,
                                                        :meeting_id,
                                                        :id,
                                                        :_destroy])
  end
end
