class TracksController < ApplicationController

  def all_saved_tracks 
    #user = User.first #give this to client, you dont want this for security reasons
    user = RSpotify::User.find(params[:id]) 
    #find a way to use token to find user
    hash = user.to_hash
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks)

    render json: tempos, status: :ok
  end 

  def tracks_for_playlist 

    user = RSpotify::User.find(params[:id]) 
 
    #find a way to use token to find user
    hash = user.to_hash
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks, params["mph"], params["height"])


    
    render json: tempos, status: :ok
  end 
end
