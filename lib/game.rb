# frozen_string_literal: false

# Game class handles all the game logic
#   It accepts board_state, player & position as inputs via its move interface.
#   Then validates the move & returns the resulting board state to the caller.
#   It checks game status after every valid move, when game over;
#   it updates @winner unless draw.
class Game
  WINNING_PERMUTATIONS =
    [[1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[3,5,7]].freeze

  attr_reader :winner
  @winner
  @player
  @position

  def initialize(player)
    @player = player
    @winner = nil
    @b = Board.new
  end

  def move(user, position_num)
    arr = @b.get_board_numbers
    unless arr.include?(position_num)
      return false
    end
    @player = user
    @position = position_num
    update_board?
  end

  def game_over?
    over = false
    over = true if @b.bFull
    if is_winner?(@player)
      set_winner(@player)
      over = true
    end
    return over
  end

  private

  def update_board?
    if @b.is_valid_position?(@position)
      @b.update_state(@player, @position)
      @b.display
      return true
    end
    return false
  end

  def is_winner?(player)
    bWin = false
    for line in WINNING_PERMUTATIONS
      if line.include?(@position) &&
            is_fill_same_user?(line,player)
        bWin = true
        break
      end
    end
    bWin
  end

  def is_fill_same_user?(idx_arr, user)
    idx_arr.all? { |i| @b.state[i-1] == user }
  end

  def set_winner(player)
    @winner = player
  end
end
