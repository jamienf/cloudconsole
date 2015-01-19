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
    @track.soundcloud = @track.soundcloud.gsub!(/"/, '').gsub!(/\s+/, "").gsub!('<iframewidth=100%height=166scrolling=noframeborder=nosrc=https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/', '').gsub!('&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false></iframe>', '')

    if @track.save
      flash[:notice] = "Track successfully saved"
      redirect_to band_song_path(@band, @song)
    else
      render :new
    end
  end

  private

  def track_params
    params.require(:track).permit(:song_id, :instrument, :soundcloud)
  end
end
