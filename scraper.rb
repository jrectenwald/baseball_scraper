# JSON Scraping
class Scraper
  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end

  def get_pitches
    xml_doc  = Nokogiri::XML(innings).xpath("//pitch")
  end




end