class TracksController < ApplicationController

  def all_saved_tracks 
    user = User.first #change this
    hash = user[:spotify_data]
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks)
    render json: tempos, status: :ok
  end 
end
