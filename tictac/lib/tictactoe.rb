
class Tictac
  def start
    #put turn = 0 in init or right after def start
    o = :o
    x = :x
    n = " "

    a = Array.new(3, n)
    b = Array.new(3, n)
    c = Array.new(3, n)

    board = [a[0], a[1], a[2], b[0], b[1], b[2], c[0], c[1], c[2]]

    turn = 0
    whoarr = []
    #############################################################
    #proc assignement
    win = -> (brd) {
      a1 = brd[0]
      a2 = brd[1]
      a3 = brd[2]

      b1 = brd[3]
      b2 = brd[4]
      b3 = brd[5]

      c1 = brd[6]
      c2 = brd[7]
      c3 = brd[8]

      done = false
      wincond = [
        [a1, b1, c1],[a2, b2, c2],[a3, b3, c3],
        [a1, a2, a3],[b1, b2 ,b3],[c1, c2, c3],
        [a1, b2, c3],[a3, b2, c1]
      ]
      wincond.each do |arr|
        unoct = 0
        dosct = 0
        arr.each do |perms|
          case perms
          when :x
            unoct += 1
          when :o
            dosct += 1
          end
          if unoct == 3
            puts "Player 1 Wins!"
            return true
          elsif dosct == 3
            puts "Player 2 Wins!"
            return true
          end
        end
      end
    }
    ###
    tie = -> (brd) {
      cap = 0
      brd.each do |check|
        if check != " "
          cap += 1
        end
      end
      if cap == 9
        puts "It's a tie!"
        return true
      end
    }

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
      return boardarr
    }

    ############################################################
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
