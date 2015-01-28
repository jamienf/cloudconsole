class BandmembersController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
  end
end
