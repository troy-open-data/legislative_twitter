class DocketsController < ApplicationController
  before_action :set_docket, only: [:show, :edit, :update, :destroy]

  # GET /dockets/1
  # GET /dockets/1.json
  def show
  end

  # GET /dockets/new
  def new
    @docket = Docket.new
  end

  # GET /dockets/1/edit
  def edit
  end

  # POST /dockets
  # POST /dockets.json
  def create
    @docket = Docket.new(docket_params)

    respond_to do |format|
      if @docket.save
        format.html { redirect_to @docket, notice: 'Docket was successfully created.' }
        format.json { render :show, status: :created, location: @docket }
      else
        format.html { render :new }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dockets/1
  # PATCH/PUT /dockets/1.json
  def update
    respond_to do |format|
      if @docket.update(docket_params)
        format.html { redirect_to @docket, notice: 'Docket was successfully updated.' }
        format.json { render :show, status: :ok, location: @docket }
      else
        format.html { render :edit }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dockets/1
  # DELETE /dockets/1.json
  def destroy
    @docket.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Docket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docket
      @docket = Docket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docket_params
      params.require(:docket).permit(:meeting_id)
    end
end
