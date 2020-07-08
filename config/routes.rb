Rails.application.routes.draw do

  get 'auth/spotify/callback', to: 'users#spotify'
  get 'saved-tracks/', to: 'tracks#all_saved_tracks', as: 'saved_tracks'

end
