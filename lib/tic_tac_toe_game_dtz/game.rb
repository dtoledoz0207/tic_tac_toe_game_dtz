require 'tic_tac_toe_game_dtz/board'

class Game
  def initialize(dimension)
    start_game(dimension)
  end

  def show_message_play_again
    print " \n ¿Do you want to play again? y/n: "
    gets.chomp.downcase
  end

  def play_again(response)
    response == 'y' ? true : false
  end

  def restart_game(player1, dimension)
    #system('clear')
    6.times do
      puts "===================================="
    end
    puts " **** #{player1 ? 'PLAYER 1' : 'PLAYER 2'} START **** "
    Board.new(dimension)
  end

  def start_game(dimension)
    player1 = true
    player2 = false

    50.times { print '*' }
    puts ' '
    board = Board.new(dimension)
    board.draw
    loop do
      if board.available_positions
        puts "#{player1 ? "PLAYER 1" : "PLAYER 2"}"
        print 'Write number row: '
        number_row = gets.chomp.to_i
        if number_row >= 1 && number_row <= dimension
          print 'Write number column: '
          number_column = gets.chomp.to_i
          if number_column >= 1 && number_column <= dimension
            if board.occupied_box(number_row, number_column)
              puts ' *** THE BOX HAS A MARK *** '
            else
              mark = player1 ? 'X' : 'O'
              board.add_mark(mark, number_row, number_column)
              board.draw

              if board.equals_marks_in_row(number_row)
                response = show_message_play_again
                if play_again(response)
                  board = restart_game(!player1, dimension)
                  board.draw
                else
                  break
                end
              end

              if board.equals_marks_in_column(number_column)
                response = show_message_play_again
                if play_again(response)
                  board = restart_game(!player1, dimension)
                  board.draw
                else
                  break
                end
              end

              if board.equals_marks_in_diagonal
                response = show_message_play_again
                if play_again(response)
                  board = restart_game(!player1, dimension)
                  board.draw
                else
                  break
                end
              end

              player1 = !player1
              player2 = !player2

            end
          else
            puts '¡Error COLUMN number NOT valid!'
          end
        else
          puts '¡Error ROW number NOT valid!'
        end
      else
        puts " \n ***===== DRAW =====*** "
        response = show_message_play_again
        if play_again(response)
          board = restart_game(player1, dimension)
          board.draw
        else
          break
        end
      end
    end
  end

end