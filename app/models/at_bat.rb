class AtBat < ActiveRecord::Base
  belongs_to :inning
  has_many :pitches

end





  # def get_pitches_data_array
  #   pitches = get_pitches
  #   pitches_array = []
  #   pitches.each do |pitch|  
  #     pitch_hash = pitch.each_with_object({}) do |pitch, hash| 
  #       hash[pitch[0]] = pitch[1] 
  #     end 
  #     pitches_array << pitch_hash
  #   end 
  #   return pitches_array
  # end
