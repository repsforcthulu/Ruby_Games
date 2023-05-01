#put turn = 0 in init or right after def start
o = :o
x = :x
n = " "

a = Array.new(3, x)
b = Array.new(3, o)
c = Array.new(3, o)

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
        done = true
      elsif dosct == 3
        puts "Player 2 Wins!"
        done = true
      end
      done
    end

    done
  end
  return done
}

############################################################
loop do
  puts "
         |     |
1     #{a[0]}  |  #{b[0]}  |  #{c[0]}
    _____|_____|_____
         |     |
2     #{a[1]}  |  #{b[1]}  |  #{c[1]}
    _____|_____|_____
         |     |
3     #{a[2]}  |  #{b[2]}  |  #{c[2]}
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
  othplayer = whoarr[-1]
  player = plarr.keep_if{|i| i != othplayer}[0]
  game[player, board]
  win[board]
  turn += 1
  whoarr << player
  whoarr.shift
  break if win == true
end
