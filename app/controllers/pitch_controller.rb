class PitchController < ApplicationController
  binding.pry
  def build_pitches
    scraper = PitchScraper.new
    pitches_hash = scraper.get_pitches_data_array
    Pitcher.create(pitches_hash)
  end

end