def getNumPlayers
    puts "Enter the number of players (max 9)"
    x = gets.chomp
    @numPlayers = Integer(x) rescue false
    if @numPlayers
        if @numPlayers == 0
            puts "You may only enter numbers 1-9"
            getNumPlayers 
        elsif @numPlayers <= 9
            @numPlayers.times do |i|
              print i 
            end 
        else 
            puts "You may not have more than 9 players"
            getNumPlayers
        end
    else
        puts "You may only enter numbers 1-9"
        getNumPlayers
    end 
end 

def getPlayerName(num)
    puts "Provide a number to denote player #{num+1}"
    playerChar = gets.chomp
end
    