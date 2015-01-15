class BandsController < ApplicationController
  def index
    @bands = Band.all
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
  private

  def band_params
    params.require(:band).permit(:name, :bio, :genre)
  end
end
