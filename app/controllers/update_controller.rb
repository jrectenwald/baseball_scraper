require 'pry'

class UpdateController

  def update_all
    puts "everything and its mother updated!"
  end

  def update_players
    puts "players updated!"
  end

  def update_pitches
    scraper = PitchScraper.new
    scraper.update_or_create_pitches
    puts "pitches updated!"
  end

  def update_at_bats
    scraper = AtBatScraper.new
    scraper.update_or_create_at_bats
    puts "at bats updated!"
  end
end