# Meeting minutes actions
class MinutesController < ApplicationController
  # GET /meetings/1/minutes
  # GET /meetings/1/minutes.pdf
  def show
    @meeting = Meeting.includes(motions: [:bill,
                                          :sponsors,
                                          :roll_calls]).find(params[:id])
  end

  # GET /meetings/1/minutes/toggle.js
  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.toggle_approval :minutes
  end
end
