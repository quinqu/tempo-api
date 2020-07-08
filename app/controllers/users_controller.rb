class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    user = User.find_by(email: @spotify_user.to_hash["email"], uri: @spotify_user.to_hash["uri"])
    if !user
      user = User.build_from_spotify(@spotify_user.to_hash)

      if !user.save
        render json: {
          errors: [
              "Not Found"
            ]
          }, status: :not_found
        return
      end
    end

    render json: user, status: :ok
    return 
  end 

  def spotify_logout 

    #delete token and spotify hash asap 

  end 

end
