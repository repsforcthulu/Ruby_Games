o = :o
x = :x
n = " "

a,b,c = Array.new(3, Array.new(3, n))

a = Array.new(3, x)
c = Array.new(3, o)

board = [a,b,c].flatten!


turn = 0
whoarr = []
#############################################################
#proc assignement
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
  end
}
###
tie = -> (brd) {
  cap = 0
  brd.each{|check| if check != " " then cap += 1 end}
  if cap == 9
    puts "It's a tie!"
    return true
  end}
#win[board]



brd = board

p   wincond = [[[brd[0], brd[3], brd[6]]],[[brd[1], brd[4], brd[7]]],[[brd[2], brd[5], brd[8]]],
[brd[0..2]],[brd[3..5]],[brd[6..8]],[[brd[0], brd[4], brd[8]]],[[brd[2], brd[4], brd[8]]]].flatten(1)

