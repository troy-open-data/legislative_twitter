class VersionsController < ApplicationController
  def revert
    @version = PaperTrail::Version.find(params[:id])
    @legislation = Legislation.find(@version.item_id)
    if @version.reify
      @version.reify.save!
      redirect_to legislation_path(@legislation), :notice => "Reverted to version from #{@version.created_at}."
    else
      raise StandardError, "cannot revert to version " + @version.id.to_s
    end
  end
end
