class BandmembersController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @bandmember = BandMember.new
  end

  def create
    @band = Band.find(params[:band_id])
    @user = User.find_by(email: params[:bandmember][:email])
    @bandmember = BandMember.create(user: @user, band: @band, owner: false)

    redirect_to @band
  end
end
