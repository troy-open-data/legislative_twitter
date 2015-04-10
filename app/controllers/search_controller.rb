class SearchController < ApplicationController
  # GET /search
  # GET /search.json
  def index
    search_term = "%#{params[:search]}%"

    # Legislation listing is case-insensitive, paginated, including attachments,
    # and ordered by creation date (newest first)
    @legislations = Legislation.
        where('title ILIKE ? OR body ILIKE ? OR short_title ILIKE ?', search_term, search_term, search_term).
        includes(:attachments).
        order('created_at DESC').page params[:page]
  end
end
