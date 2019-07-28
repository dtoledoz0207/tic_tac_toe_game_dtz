#module TicTacToeGameDtz
class Board
  attr_writer :dimension

  def initialize(dimension)
    @dimension = dimension
    @board = []
    @counter_available_positions = @dimension ** 2

    @dimension.times do
      @board << Array.new(@dimension, '_')
    end

    @mark_x_winner = ''
    @dimension.times { @mark_x_winner << 'X' }
    @mark_o_winner = ''
    @dimension.times { @mark_o_winner << 'O' }
  end


  def draw
    puts ' '
    @dimension.times { |column_number| print "   #{column_number + 1} " }
    2.times { puts ' ' }
  
    @board.each_with_index do |row, index|
      print "#{ index + 1 }  "
      fila.each do |column|
        print column
        print '    '
      end
      2.times { puts ' ' }
    end
    puts ' '
  end
  
  def available_positions
    @counter_available_positions > 0 ? true : false
  end
end
#end

