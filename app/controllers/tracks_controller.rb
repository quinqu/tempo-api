class TracksController < ApplicationController

  def all_saved_tracks 
    # find by id 
    # 
    #user = User.first #give this to client, you dont want this for security reasons
    user = RSpotify::User.new(request.env['omniauth.auth'])
    hash = user.to_hash
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks)
    render json: tempos, status: :ok
  end 
end
