class UpdateMenu

  def initialize
    self.run
  end

  def run
    update_controller = UpdateController.new

    puts "Which parts of the database would you like to update? (all, players, pitches)"
    command = gets.chomp


    case command
    when "all"
      update_controller.update_all
    when "players"
      update_controller.update_players
    when "pitches"
      update_controller.update_pitches
    when "at bats"
      update_controller.update_at_bats
    end
  end
end