class AtBat < ActiveRecord::Base

  def get_atbats
    xml_doc  = Nokogiri::XML(open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
).xpath("//atbat")
  end


end