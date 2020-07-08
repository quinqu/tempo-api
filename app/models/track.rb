class Track < ApplicationRecord

  #height (inches) to stride (ft)
  





  def self.tempos(saved_tracks, mph, inches)
    songs = {}

    tempo = Track.calculate_tempo(mph.to_f, inches) 

    saved_tracks.each do |song| 
      features = RSpotify::AudioFeatures.find(song.id)
      if !songs[song.name] && features.tempo <= (tempo+10) && features.tempo >= (tempo - 10)
        songs[song.name] = features.tempo
      end 
    end 
    return songs
  end 

  private

  def self.calculate_tempo(mph, inches)
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

    stride = height_to_stride[inches]
    bpm = (5280 * mph.to_f) / (stride * 60.0)
    return bpm 
  end 


end
