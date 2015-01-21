class SongsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    if signed_in?
      if @band.band_members.find_by(user_id: current_user.id)
        @song = Song.new
      end
    else
      flash[:notice] = "You are not authorized to access that page!"
      redirect_to root_path
    end
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
    @tracks = @song.tracks
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

  def destroy
    @band = Band.find(params[:band_id])
    @song = @band.songs.find(params[:id])
    @song.destroy
    redirect_to band_path(@band)
  end

  private

  def song_params
    params.require(:song).permit(:band_id, :title, :tempo)
  end
end
