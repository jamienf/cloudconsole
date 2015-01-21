class TracksController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @track = Track.new
  end

  def create
    @song = Song.find(params[:song_id])
    @band = @song.band.id
    @track = Track.new(track_params)
    @track.song_id = @song.id

    track_url = @track.soundcloud
    sc_match = /https:\/\/soundcloud.com\/[A-Z0-9._%+-]+\/[A-Z0-9._%+-]+/i

    if sc_match.match(track_url)
      soundcloud_api = @track.soundcloud_url.get('/resolve', url: track_url)
      @track.soundcloud = soundcloud_api.id

      if @track.save
        flash[:notice] = "Track successfully saved"
        redirect_to band_song_path(@band, @song)
      end

    else
      flash[:notice] = "Please enter a valid Soundcloud URL"
      render :new
    end

  end

  private

  def track_params
    params.require(:track).permit(:song_id, :instrument, :soundcloud)
  end
end
