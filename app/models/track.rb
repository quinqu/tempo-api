class Track < ApplicationRecord

  def self.tempos(saved_tracks)
    songs = {}
    saved_tracks.each do |song| 
      if !songs[song.name]
        features = RSpotify::AudioFeatures.find(song.id)
        songs[song.name] = features.tempo
      end 
    end 
    return songs
  end 
end
