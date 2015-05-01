# Versioning actions
class VersionsController < ApplicationController
  # change the current document to the specified version
  # reify gives you the object of this version
  def revert
    @version = PaperTrail::Version.find(params[:id])
    @bill = Bill.find(@version.item_id)
    if @version.reify
      @version.reify.save!
      redirect_to bill_path(@bill),
                  notice: "Rolled back to version from #{@version.created_at}."
    else
      fail StandardError, "cannot revert to version #{@version.id}"
    end
  end
end
