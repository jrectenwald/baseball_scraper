require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'mechanize'

class GameScraper

  def innings
    open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
  end
  
  def get_game
    xml_doc  = Nokogiri::XML(innings).xpath("//game")
  end

  def update_or_create_games
    at_bat_scraper = AtBatScraper.new
    page = get_game
    game = Game.create
    page.xpath("//inning").each do |inning|
      new_inning_obj = Inning.create(number: inning.values[0], away_team: inning.values[1], home_team: inning.values[2], next_inning: inning.values[3])
      game.innings << new_inning_obj
      inning.children.each do |t_or_b|
        t_or_b.xpath("//atbat").each do |at_bat|
          at_bat_hash = at_bat_scraper.get_at_bat_hash(at_bat)
          new_at_bat_obj = AtBat.create(at_bat_hash)
          new_at_bat_obj.top_or_bottom = t_or_b.name
          new_inning_obj.at_bats << new_at_bat_obj
        end
      end
    end
  end

  def build_innings
  end

  def build_at_bats
  end

  def build_pitches
  end

  def build_runners
  end

end