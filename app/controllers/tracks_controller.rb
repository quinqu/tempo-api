class TracksController < ApplicationController

  def all_saved_tracks 
    user = RSpotify::User.find(params[:id]) 
    hash = user.to_hash
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks)

    render json: tempos, status: :ok
  end 

  def tracks_for_playlist 

    user = RSpotify::User.find(params[:id]) 
 
    hash = user.to_hash
    spotify_user = RSpotify::User.new(hash)
    tracks = spotify_user.saved_tracks
    tempos = Track.tempos(tracks, params["metric"], params["speed"], params["height"])

    if Track.create_playlist_spotify(user, params["metric"], params["speed"], tempos) 
      render json: tempos, status: :ok
      return 
    else
      render json: {
        errors: [
              "Something went wrong :("
            ]
      }, status: :not_found
      
    end 
  end 
end
