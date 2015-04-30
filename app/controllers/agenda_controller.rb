# Meeting agenda actions
class AgendaController < ApplicationController
  # GET /meetings/1/agenda
  # GET /meetings/1/agenda.pdf
  def show
    @meeting = Meeting.includes(motions: [:bill]).find(params[:id])

    default_attachments = { bill: true, attachments: true }
    @attach = params[:attach] || default_attachments
  end

  # GET /meetings/1/agenda/toggle.js
  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.toggle_approval :agenda
  end
end
