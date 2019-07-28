require 'tic_tac_toe_game_dtz/board'

RSpec.describe Board do
  describe '#available_positions' do
    context 'When there are free positions' do
      it 'is true and the game continue' do
        board = Board.new(3)
        expect(board.available_positions).to be true
      end
    end
    context 'When there are No free positions' do
      it 'is false and the game is over by draw' do
        board = Board.new(0)
        expect(board.available_positions).to be false
      end
    end
  end

  describe '#occupied_box' do
    context 'When there is a X or O mark in the box' do
      it 'is true, the user cannot put a mark in that box' do
        board = Board.new(3)
        board.board = [['_','_','_'], ['_','X','_'], ['_','_','_']]
        row = 2
        column = 2
        expect(board.occupied_box(row, column)).to be true
      end
    end
    context 'When there is NO a X or O mark in the box' do
      it 'is false, the user can put a mark in that box' do
        board = Board.new(3)
        board.board = [['_','_','_'], ['_','_','_'], ['_','_','_']]
        row = 2
        column = 2
        expect(board.occupied_box(row, column)).to be false
      end
    end
  end

  describe '#equals_marks_in_row' do
    context 'When there are equals player marks in a row' do
      it 'is true and one player win' do
        board = Board.new(3)
        board.board = [['O','O','O'], ['_','_','_'], ['_','_','_']]
        row = 1
        expect(board.equals_marks_in_row(row)).to be true
      end
    end
  end

  describe '#equals_marks_in_column' do
    context 'When there are equals player marks in a column' do
      it 'is true and one player win' do
        board = Board.new(3)
        board.board = [['X','_','_'], ['X','_','_'], ['X','_','_']]
        column = 1
        expect(board.equals_marks_in_column(column)).to be true
      end
    end
  end

  describe '#equals_marks_in_diagonal' do
    context 'When there are equals player marks in diagonal' do
      it 'is true and one player win' do
        board = Board.new(3)
        board.board = [['O','_','_'], ['_','O','_'], ['_','_','O']]
        expect(board.equals_marks_in_diagonal).to be true
      end
    end
  end

end
