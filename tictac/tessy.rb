class Tictac
  def start
    o = :o
    x = :x
    n = " "
    a,b,c = Array.new(3, Array.new(3, n))
    board = [a,b,c].flatten!
    turn = 0
    whoarr = []
    win = -> (brd) {
      done = false
      wincond = [[[brd[0], brd[3], brd[6]]],[[brd[1], brd[4], brd[7]]],[[brd[2], brd[5], brd[8]]],
      [brd[0..2]],[brd[3..5]],[brd[6..8]],[[brd[0], brd[4], brd[8]]],[[brd[2], brd[4], brd[8]]]].flatten(1)
      wincond.each do |arr|
        unoct = 0
        dosct = 0
        arr.each{|perms| if perms == :x then unoct += 1 elsif perms == :o then dosct += 1 end}
        if unoct == 3
          puts "Player 1 Wins!"
          return true
        elsif dosct == 3
          puts "Player 2 Wins!"
          return true
        end
      end}
    tie = -> (brd) {
      cap = 0
      brd.each{|check| if check != " " then cap += 1 end}
      if cap == 9
        puts "It's a tie!"
        return true
      end}
    assign = -> (player, play, boardarr) {
      case player
      when :p1
        weapon = :x
      when :p2
        weapon = :o
      end
      inner = -> (boardarr, num) {
        if boardarr[num] == " "
          boardarr[num] = weapon
        else
          puts "spot not empty; please choose a valid space"
          ply = gets.chomp.downcase
          assign[player, ply, boardarr]
        end
        }
      case play
      when "a1"
        inner[boardarr, 0]
      when "a2"
        inner[boardarr, 1]
      when "a3"
        inner[boardarr, 2]
      when "b1"
        inner[boardarr, 3]
      when "b2"
        inner[boardarr, 4]
      when "b3"
        inner[boardarr, 5]
      when "c1"
        inner[boardarr, 6]
      when "c2"
        inner[boardarr, 7]
      when "c3"
        inner[boardarr, 8]
      end
      return boardarr}
    loop do
      puts "
             |     |
    1     #{board[0]}  |  #{board[3]}  |  #{board[6]}
        _____|_____|_____
             |     |
    2     #{board[1]}  |  #{board[4]}  |  #{board[7]}
        _____|_____|_____
             |     |
    3     #{board[2]}  |  #{board[5]}  |  #{board[8]}
             |     |

          A     B     C
          "
      plarr = [:p1, :p2]
      if turn == 0
        player = plarr.sample
        othplayer = plarr.keep_if{|elem| elem != player}[0]
        whoarr << player
        turn += 1
      end
      done = win[board]
      match = tie[board]
      if done == true || match == true
        puts "play again? (y/n)"
        ans = gets.chomp.downcase
        if ans == "y"
          Tictac.new.start
        elsif ans == "n" #break + return + if instead of case as bugfix
          break
          return #add else for invalid ans
        end
      end
      othplayer = whoarr[-1]
      player = plarr.keep_if{|i| i != othplayer}[0]
      puts "#{player} turn!"
      play = gets.chomp.downcase
      assign[player, play, board]
      whoarr << player
      whoarr.shift
    end
  end
end

Tictac.new.start
