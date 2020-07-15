class TracksController < ApplicationController

  def all_saved_tracks 
    #user = User.first #give this to client, you dont want this for security reasons
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
    tempos = Track.tempos(tracks, params["mph"], params["height"])

    if Track.create_playlist_spotify(user, params["mph"], tempos) 
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
