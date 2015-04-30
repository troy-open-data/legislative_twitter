module API
  module V1
    # Actions for the v1 People API
    class PeopleController < ApiVersionsController
      # GET /api/people.json
      def index
        @people = Person.all
      end

      # GET /api/people/1.json
      def show
        @person = Person.find(params[:id])
      end
    end
  end
end
