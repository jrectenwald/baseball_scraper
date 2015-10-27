require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'mechanize'

class AtBatScraper
  
  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end

  def get_at_bats
    xml_doc  = Nokogiri::XML(innings).xpath("//atbat")
  end

  def get_at_bats_data_array


    
    # at_bats = get_at_bats
    # at_bats_array = []
    # at_bats.each do |at_bat|  
    #   at_bat_hash = at_bat.each_with_object({}) do |at_bat, hash|
    #     #replace type with result, type is an activerecord keyword, and id must be stored as an integer
    #     if at_bat[0] == "id"
    #       hash[at_bat[0]] = at_bat[1].to_i
    #     else
    #       hash[at_bat[0]] = at_bat[1]
    #     end
    #   end 
    #   at_bats_array << pitch_hash
    # end 
    # return at_bats_array
  end

  # def update_or_create_pitches
  #   pitch = Pitch.create(get_pitches_data_array)
  # end

  # def iterate_through_pages
  #   mechanize = Mechanize.new
  #   mlb_root = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
  #   year_links = ""
  #   month_links = ""
  #   day_links = ""
  #   innings_link = ""
  # end
end

x = 1




