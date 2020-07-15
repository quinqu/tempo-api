require 'concurrent'

class UsersController < ApplicationController
  
  def spotify

    
    @spotify_user = Concurrent::Future.execute { RSpotify::User.new(request.env['omniauth.auth']) }
    
    redirect_to "heightScheme://#{@spotify_user.value.id}"
    return
  end 


end
