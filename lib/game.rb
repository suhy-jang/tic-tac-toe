# frozen_string_literal: false

# Game class handles all the game logic
#   It accepts board_state, player & position as inputs via its move interface.
#   Then validates the move & returns the resulting board state to the caller.
#   It checks game status after every valid move, when game over;
#   it updates @winner unless draw.
class Game
  WINNING_PERMUTATIONS = [
    [1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[3,5,7]
  ].freeze

  attr_reader :winner

  def initialize (user1, user2, board)
    @player1 = user1
    @player2 = user2
    @board = board
    @winner = nil
    @turn = 0
  end

  def game_start
    name = UserInterface::ask_who_first(@player1.name, @player2.name)
    @turn = (@player1.name == name)? 0: 1
    until is_board_full? || is_winner?
      (0 == @turn)? play(@player1) : play(@player2)
      @turn = (@turn+1)%2
      puts "log: this turn is #{@turn}"
    end
  end

  def play(player)
    loop do
      @board.display
      position = UserInterface::ask_position(player.name)
      #puts "log: ask again"
      next unless board_valid?(position)
      puts "log: before move"
      move(player, position)
      puts "log: after move"
      break
    end
    puts "log: player one end"
  end

  def game_end
    if @winner
      UserInterface::inform_result(@winner)
    else
      UserInterface::inform_result
    end
  end

  private
  def board_valid?(position)
    t = @board.is_valid_position?(position)
    puts "log: valid? #{t}"
    t
  end

  def is_board_full?
    @board.bFull
  end

  def move(player, position)
    puts "log: symbol is #{player.symbol}"
    @board.update_state(player.symbol, position)
    @board.display
    winner_update(player, position)
  end

  def winner_update(player, position)
    bWin = false
    for line in WINNING_PERMUTATIONS
      if line.include?(position) &&
            is_fill_same_user?(line, player)
        bWin = true
        set_winner(player)
        break
      end
    end
    puts "log: winner #{bWin}"
    bWin
  end

  #it seems able to improve speed
  def is_winner?
    !@winner.nil?
  end

  def is_fill_same_user?(idx_arr, player)
    idx_arr.all? { |i| @board.state[i-1] == player.symbol }
  end

  def set_winner(player)
    @winner = player.name
    puts "log: set user with #{player.name}"
  end
end
