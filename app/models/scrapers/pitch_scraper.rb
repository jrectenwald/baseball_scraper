require_relative '../../config/environment'

class PitcherScraper
  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end

  def get_pitches
    xml_doc  = Nokogiri::XML(innings).xpath("//pitch")
  end



  def new_pitch_hash
    pitches = get_pitches

    pitches.each do |pitch|  
    a.hash = scraper.get_pitches.first.each_with_object({}) do |pitch, pitch_hash|
      pitch_hash[pitch[0]] = pitch[1]  
    end 
  end
end
