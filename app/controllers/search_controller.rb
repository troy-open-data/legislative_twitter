class SearchController < ApplicationController
  def search
    search_term = "%#{params[:search]}%"
    @legislations = Legislation.
        where('title ILIKE ? OR body ILIKE ?', search_term, search_term).
        order('created_at DESC').page params[:page]
  end
end
