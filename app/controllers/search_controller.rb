# Searching actions
class SearchController < ApplicationController
  # GET /search
  # GET /search.json
  def index
    search_term = "%#{params[:search]}%"

    @bills = Bill
             .where('title ILIKE ? OR short_title ILIKE ?',
                    search_term, search_term)
             .order('created_at DESC')
             .page params[:page]
  end
end
