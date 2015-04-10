class VersionsController < ApplicationController

  def revert
    # change the current document to the specified version
    # reify gives you the object of this version
    @version = PaperTrail::Version.find(params[:id])
    @legislation = Legislation.find(@version.item_id)
    if @version.reify
      @version.reify.save!
      redirect_to legislation_path(@legislation),
                  :notice => "Rolled back to version from #{@version.created_at}."
    else
      raise StandardError, 'cannot revert to version ' + @version.id.to_s
    end
  end

end
