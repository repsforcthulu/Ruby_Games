player = :p1
#########################################
#def start
o = :o
x = :x
n = " "
a = Array.new(3, x)
b = Array.new(3, o)
c = Array.new(3, n)

board = [a[0], a[1], a[2], b[0], b[1], b[2], c[0], c[1], c[2]]
#############################################################
#proc assignment
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
##############################################################
#loop do

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

i = gets.chomp.downcaseboardview = puts "
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

board = assign[player, i, board]
p board
