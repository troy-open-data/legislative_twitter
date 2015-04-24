module API::V1
  class PeopleController < ApiVersionsController
    before_action :set_person, only: :show

    # GET /api/people.json
    def index
      @people = Person.all
    end

    # GET /api/people/1.json
    def show
    end

    private

    def set_person
      @person = Person.find(params[:id])
    end
  end
end