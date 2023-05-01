game = -> (count, player, board) {  ##dont really need proc for that...
  if count = 0
    player = [:p1, :p2].sample           #for turn 1
  end
  puts board
  puts "#{player} turn"
  play = gets.chomp.downcase#.to_sym for refact?
  assign[player, play, board]

}


#what this has:
#puts board
#player turn
#play as gets
#assign proc *******
