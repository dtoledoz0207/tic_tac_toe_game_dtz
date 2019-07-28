require 'tic_tac_toe_game_dtz/board'

RSpec.describe Board do
  describe '#available_positions' do
    context 'When there are available positions' do
      it 'is true and the game continue' do
        board = Board.new(3)
        expect(board.available_positions).to be true
      end
    end
    context 'When there are No available positions' do
      it 'is false and the game is over' do
        board = Board.new(0)
        expect(board.available_positions).to be false
      end
    end
  end
end
