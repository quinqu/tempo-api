
class User < ApplicationRecord

  def self.build_from_spotify(user_hash)
    user = User.new
    user.display_name = user_hash["display_name"]
    user.email = user_hash["email"]
    user.uri = user_hash["uri"]
    user.token = user_hash["credentials"]["token"]
    user.spotify_data = user_hash
    return user
  end

end
