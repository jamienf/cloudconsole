class SongsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @song = Song.new
  end

  def create
    @band = Band.find(params[:band_id])
    @song = Song.new(song_params)
    @song.band_id = @band.id

    if @song.save
      redirect_to band_song_path(@band, @song)
      flash[:notice] = "Your band has been successfully added."
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:band_id])
    @song = @band.songs.find(params[:id])
  end

  def edit
    @band = Band.find(params[:band_id])
    @song = @band.songs.find(params[:id])
  end

  def update
    @band = Band.find(params[:band_id])
    @song = Song.new(song_params)
    @song.band_id = @band.id

    if @song.save
      redirect_to band_song_path(@band, @song)
      flash[:notice] = "Your song has been successfully added."
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:band_id, :title, :tempo)
  end
end
