require 'pry'
require 'Nokogiri'
require 'open-uri'
class PitcherScraper
  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end

  def get_pitches
    xml_doc  = Nokogiri::XML(innings).xpath("//pitch")
  end



  def get_pitches_data_array
    pitches = get_pitches
    pitches_array = []
    pitches.each do |pitch|  
      pitch_hash = pitch.each_with_object({}) do |pitch, hash| 
        hash[pitch[0]] = pitch[1] 
      end 
      pitches_array << pitch_hash
    end 
    return pitches_array
  end


end


binding.pry  

x = 1