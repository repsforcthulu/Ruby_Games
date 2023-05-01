o = :o
x = :x
n = " "

a = Array.new(3, n)
b = Array.new(3, n)
c = Array.new(3, n)

board = [a[0], a[1], a[2], b[0], b[1], b[2], c[0], c[1], c[2]]

boardview = puts "
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
