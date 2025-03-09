require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'
require_relative 'players'
require "pry"
require 'io/console'

numPlayers = getNumPlayers
players = []

numPlayers.times do |i|
  playerName = getPlayerName(i)
  puts "playerName is #{playerName}"
  players.push(playerName)
end

playerSymbols = players.map(&:to_sym)
die = Die.new

game = RubyRacer.new(playerSymbols, die, numPlayers)

# Clear the screen and print the board
# with players in their starting positions.
# Then pause, so users can see the starting board.
reset_screen
puts game.board_visualization
sleep(1)


# Play the game.
until game.finished?
  # Do this each round until the game is finished.

# binding.pry
  # Move each player forward.
  char = STDIN.getch
  char_symbol = char.to_sym
  if char == 'q'
    puts 'Exiting...'
    break 
  else
    if (playerSymbols.include?(char_symbol))
      game.advance_player(char_symbol)
    else  
      puts "Invalid input, press a player's symbol, or 'q'."
    end
  end

  # Now that each player has moved,
  # reprint the board with the new player positions
  # and pause so users can see the updated board.
  reset_screen
  puts game.board_visualization
  sleep(0.2)
end

# Once the game is finished, report the winner.
puts "Player '#{game.winner}' wins!"
