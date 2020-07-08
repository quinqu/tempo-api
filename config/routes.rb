Rails.application.routes.draw do

  get 'auth/spotify/callback', to: 'users#spotify'
  get 'saved-tracks/:id', to: 'tracks#all_saved_tracks', as: 'saved_tracks'

  get 'playlist/:id/', to: 'tracks#tracks_for_playlist'

  #get 'playlist' 


end
