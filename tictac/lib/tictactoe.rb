class Tictac
  def play
    board = {
    a: {
      a1: {elem: nil, fill: false},
      a2: {elem: nil, fill: false},
      a3: {elem: nil, fill: false}
    },
    b: {
      b1: {elem: :o, fill: true},
      b2: {elem: :o, fill: true},
      b3: {elem: :x, fill: true}
    },
    c: {
      c1: {elem: :o, fill: true},
      c2: {elem: :x, fill: true},
      c3: {elem: :x, fill: true}
    }}
    board.map do |ckey, cap| #each map accesses both key and val; needs both or won't function(?)
      cap.map do |lkey, low| #board.map{|ckey, cap| cap.map{|lkey, low| low.map{|k, v| p k, v}}}
        low.map do |elem|    #prints [[[[:elem, nil], [:fill, false], [:elem, :o], [:fill, true]]]]
                             #structure
        end
      end
    end

    game = puts "
             |     |
    1     #{board[:A][:a1][:elem]}  |  #{board[:B][:b1][:elem]}  |  #{board[:C][:c1][:elem]}
        _____|_____|_____
             |     |
    2     #{board[:A][:a2][:elem]}  |  #{board[:B][:b2][:elem]}  |  #{board[:C][:c2][:elem]}
        _____|_____|_____
             |     |
    3     #{board[:A][:a3][:elem]}  |  #{board[:B][:b3][:elem]}  |  #{board[:C][:c3][:elem]}
             |     |

          A     B     C"





  end
end


p Tictac.new.play
