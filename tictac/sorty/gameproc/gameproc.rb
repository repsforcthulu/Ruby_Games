game = -> (count, player, board) {
  if count = 0
    player = [:p1, :p2].sample           #for turn 1
  end
  puts board
  puts "#{player} turn"
  play = gets.chomp.downcase#.to_sym for refact?
  assign[player, play, board]
  count += 1
}
