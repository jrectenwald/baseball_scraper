require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'mechanize'

class PitchScraper

  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end
  
  def get_at_bats
    xml_doc  = Nokogiri::XML(innings).xpath("//atbat")
  end

  def get_pitches_data_array
    at_bats = get_at_bats
    pitches_array = []
    at_bats.each do |bat|
      bat.children.each do |pitch|
        pitch_hash = pitch.each_with_object({}) do |att, hash|
          if att[0] == "type" 
            hash["result"] = att[1]
          elsif att[0] == "id"
            hash[att[0]] = att[1].to_i
          else
            hash[att[0]] = att[1]
          end
          hash[:batter_id] = bat.values[6]
          hash[:pitcher_id] = bat.values[9]
        end
        pitches_array << pitch_hash
      end 
    end 
    return pitches_array
  end

  def update_or_create_pitches
    pitch = Pitch.create(get_pitches_data_array)
  end

  def iterate_through_pages
    mechanize = Mechanize.new
    mlb_root = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
    year_links = ""
    month_links = ""
    day_links = ""
    innings_link = ""
  end
end

binding.pry

x = 1
