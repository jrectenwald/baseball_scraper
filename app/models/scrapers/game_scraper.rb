require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'mechanize'

class GameScraper

  def innings(url)
    open(url).read
  end
  
  def get_game(url)
    xml_doc  = Nokogiri::XML(innings(url)).xpath("//game")
  end

  def update_or_create_games(page)
    at_bat_scraper = AtBatScraper.new
    pitch_scraper = PitchScraper.new
    game = Game.create
    page.xpath("//inning").each do |inning|
      new_inning_obj = Inning.find_or_create_by(number: inning.values[0], away_team: inning.values[1], home_team: inning.values[2], next_inning: inning.values[3])
      game.innings << new_inning_obj
      inning.children.each do |t_or_b|
        t_or_b.children.each do |at_bat|
          at_bat_hash = at_bat_scraper.get_at_bat_hash(at_bat)
          new_at_bat_obj = AtBat.find_or_create_by(at_bat_hash)
          new_at_bat_obj.top_or_bottom = t_or_b.name
          new_inning_obj.at_bats << new_at_bat_obj
          at_bat.children.each do |pitch|
            pitch_hash = pitch_scraper.get_pitch_hash(pitch, at_bat)
            begin
              if pitch_hash[:break_angle]
                new_pitch_obj = Pitch.create(pitch_hash)
                new_pitch_obj.at_bat_id = new_at_bat_obj.id
                new_pitch_obj.save
              end
            rescue ActiveRecord::RecordNotUnique
              binding.pry
            end
          end
        end
      end
    end
  end

  def page_navigation
    mechanize = Mechanize.new
    main_page = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
    main_page.links.each do |year_link|
      if year_link.text.include?("2014")
        year_page = year_link.click
        year_page.links.each do |month_link|
          if month_link.text.include?("05")
            month_page = month_link.click
            month_page.links.each do |day_link|
              if day_link.text.include?("12")
                day_page = day_link.click
                day_page.links.each do |game_link|
                  if game_link.text.include?("gid")
                    game_page = game_link.click
                    game_page.links.each do |innings_link|
                      if innings_link.text.include?("inning")
                        inning_page = innings_link.click
                        inning_page.links.each do |all_innings|
                          if all_innings.text.include?("all")
                            all_innings_page = all_innings.click
                            url = all_innings_page.uri
                            game = get_game(url)
                            update_or_create_games(game)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end