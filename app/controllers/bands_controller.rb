class BandsController < ApplicationController
  def index
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_path(@band)
      flash[:notice] = "Your band has been successfully added."
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :bio, :genre)
  end
end
