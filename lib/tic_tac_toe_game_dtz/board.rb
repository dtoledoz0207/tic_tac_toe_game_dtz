#module TicTacToeGameDtz
class Board
  attr_writer :dimension, :board

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
      row.each do |column|
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

  def occupied_box(row, column)
    box_content = @board[row - 1][column - 1]
    box_content == 'X' || box_content == 'O' ? true : false
  end

  def add_mark(mark, row, column)
    @counter_available_positions -= 1
    @board[row - 1][column - 1] = mark
  end

  def equals_marks_in_row(row)
    marks_in_row = ''
    @board[row - 1].each do |column|
      marks_in_row << column
    end

    if marks_in_row == @mark_x_winner
      puts ' ***** ¡PLAYER 1 IS THE WINNER! ***** '
      true
    elsif marks_in_row == @mark_o_winner
      puts ' ***** ¡PLAYER 2 IS THE WINNER! ***** '
      true
    end
  end

  def equals_marks_in_column(column)
    marks_in_column = ''
    @board.each do |row|
      marks_in_column << row[column - 1]
    end

    if marks_in_column == @mark_x_winner
      puts ' ***** ¡PLAYER 1 IS THE WINNER! ***** '
      true
    elsif marks_in_column == @mark_o_winner
      puts ' ***** ¡PLAYER 2 IS THE WINNER! ***** '
      true
    end
  end

  def equals_marks_in_diagonal
    marks_in_right_diagonal = ''
    marks_in_left_diagonal = ''
    @board.each_with_index do |row, index|
      number_right_to_left_column = index
      number_left_to_right_column = -(index + 1)
      marks_in_right_diagonal << row[number_right_to_left_column]
      marks_in_left_diagonal << row[number_left_to_right_column]
    end

    if marks_in_right_diagonal == @mark_x_winner || marks_in_left_diagonal == @mark_x_winner
      puts ' ***** ¡PLAYER 1 IS THE WINNER! ***** '
      true
    elsif marks_in_right_diagonal == @mark_o_winner || marks_in_left_diagonal == @mark_o_winner
      puts ' ***** ¡PLAYER 2 IS THE WINNER! ***** '
      true
    end
  end

end
#end

