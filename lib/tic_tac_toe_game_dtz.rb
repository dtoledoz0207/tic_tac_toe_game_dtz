require 'tic_tac_toe_game_dtz/game'

class TicTacToeGameDtz
  def initialize
    welcome
  end

  def welcome
    puts ' '
    puts ' **************** WELCOME TO TIC TAC TOE GAME **************** '
    puts ' '
    puts 'Choose an option to start the game'
    puts '  a - Classic game 3 x 3'
    puts '  b - Change the board dimension'
    print 'Write an option: '
    option = gets.chomp.downcase

    case option
    when 'a'
      game = Game.new(3)
    when 'b'
      print 'Write a number between 3 and 10 to change the board dimension: '
      dimension = gets.chomp.to_i
      if dimension >= 3 && dimension <= 10
        game = Game.new(dimension)
      else
        puts "Invalid dimension"
      end
    else
      puts 'INVALID OPTION, BYE'
    end
  end
end

#play = TicTacToeGameDtz.new