class MainMenu

  def menu
    puts "\t\t\t\sMajor League Baseball\n\t\t\t-----------------------\n\t\t\t\s\s\s\s\s\sData Manager\n\n"

    puts "Enter a command or type 'help' for options. (update, data, help, quit)"
    # command = gets.chomp

    command = gets.chomp

    while command != "quit"

      case command
      when "update"
        UpdateMenu.new
      when "data"
        DataMenu.new
      when "help"
        HelpMenu.new
      end

      if command != "quit"
        puts "Enter a command or type 'help' for a list of options."
        command = gets.chomp 
      end
    end
  end
end