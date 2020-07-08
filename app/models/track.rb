class Track < ApplicationRecord

  #height (inches) to stride (ft)
  MILES_STEPS = 5280

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
    75 => 2.58
  }



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

  def self.find_tracks_with_tempo 





  end 

  private 

  def calculate_tempo(mph, inches)
    if inches < 60 || inches > 75
      raise
    end 
    stride = height_to_stride[:inches]
    bpm = (MILES_STEPS * mph) / (stride * 60)
    return bpm 
  end 


end
