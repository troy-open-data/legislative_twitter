class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :agenda]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all.includes(:organization).order('date DESC')
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    # @legislations = @meeting.legislations.uniq
    # # @grouped_legislations = @meeting.legislations.
    #     uniq.
    #     sort_by{|l| l.created_at}.
    #     group_by{|l| l.legislation_type}
  end

  # GET /meetings/1/agenda
  # GET /meetings/1/agenda.json
  # GET /meetings/1/agenda.pdf
  def agenda
    # @legislations = @meeting.legislations.uniq
    # @grouped_legislations = @meeting.legislations.
    #     uniq.
    #     sort_by{|l| l.created_at}.
    #     group_by{|l| l.legislation_type}

    respond_to do |format|
      format.html
      format.json
      format.pdf
    end
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:organization_id, :date,
                                    folios_attributes: [:sponsor,
                                                        :vote,
                                                        :legislation_id,
                                                        :meeting_id,
                                                        :notes,
                                                        :id,
                                                        :_destroy])
  end
end
