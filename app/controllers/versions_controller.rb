class VersionsController < ApplicationController
  def revert
    @version = PaperTrail::Version.find(params[:id])
    if @version.reify
      @version.reify.save!
      redirect_to :back, :notice => "Reverted to version from #{@version.created_at}."
    end
  #   todo: error handling
  #   todo: test
  end
end
