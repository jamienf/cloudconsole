class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    @songs = @band.songs
  end

  def new
    if signed_in?
      @band = Band.new
      @band_owner = Band.new
    else
      flash[:notice] = "Please sign in to create a new band"
      redirect_to root_path
    end
  end

  def create
    @band = Band.new(band_params)
    uploader = BandPhotoUploader.new
    uploader.store!(params[:band_photo])
    if @band.save
      @band_owner = BandMember.new(user_id: current_user.id, band_id: @band.id, owner: true)

      if @band_owner.save
        redirect_to band_path(@band)
        flash[:notice] = "Your band has been successfully added."
      end

    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_path(@band)
      flash[:notice] = "Your band has been successfully updated."
    else
      render :edit
      flash[:alert] = "Please fill out the forms correctly."
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash[:notice] = "Your band has been successfully deleted."
    redirect_to root_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :bio, :genre, :band_photo)
  end
end
