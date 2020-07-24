class Track < ApplicationRecord

  def self.tempos(saved_tracks, metric, speed, inches)
    songs = []
    tempo = Track.calculate_tempo(metric, speed.to_f, inches) 

    saved_tracks.each do |song| 
      features = RSpotify::AudioFeatures.find(song.id)
      if features.tempo <= (tempo + 10) && features.tempo >= (tempo - 10)
        songs << song
      end 
    end 
    return songs
  end
  
  def self.create_playlist_spotify(user, metric, speed, tracks)
    playlist = user.create_playlist!("Tempo - #{speed} #{metric}")
    playlist.add_tracks!(tracks)
    puts tracks
    return playlist.tracks.size == tracks.length 
  end

  private

  def self.calculate_tempo(metric, speed, inches)
    height_to_stride = {
      60 => 2.08, 
      61 => 2.08,
      62 => 2.16,
      63 => 2.16,
      64 => 2.16,
      65 => 2.25,
      66 => 2.25,
      67 => 2.33,
      68 => 2.33, 
      69 => 3.33,
      70 => 2.42, 
      71 => 2.42, 
      72 => 2.50,
      73 => 2.50,
      74 => 2.58, 
      75 => 2.58,
    }

    inches = inches.to_i
    if inches < 60 || inches > 75
      raise
    end 

    if !height_to_stride[inches]
      raise
    end 

    bpm = 0.0

    stride = height_to_stride[inches]
    puts metric
    if metric == "mph" 
      bpm = (5280 * speed.to_f) / (stride * 60.0)
    elsif metric == "kph"
      bpm = (5280 * (speed.to_f / 1.609)) / (stride * 60.0)
    elsif metric == "mpm"
      bpm = (5280 * (60 / speed.to_f )) / (stride * 60.0)
    end 
    puts bpm
      
    return bpm 
  end 
end

