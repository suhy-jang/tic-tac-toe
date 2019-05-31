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

  def initialize (player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = nil
    @turn = 0
  end

  def game_start
    decide_first_player
    show_board
    until @board.full? || is_winner?
      (0 == @turn)? play(@player1) : play(@player2)
      change_turn
    end
    show_board
    show_winner
  end

  private

  def play(player)
    puts "log: this turn is '#{player.name}' "
    loop do
      position = UserInterface::ask_position(player.name, player.stone)
      response = board_valid(position)
      if response > 0
        show_board
        UserInterface::throw_wrong_place_error if 1 == response
        UserInterface::throw_wrong_place_error (position) if 2 == response
      else
        move(player, position)
        show_board
        UserInterface::inform_success
        break
      end
    end
    puts "log: '#{player.name}' turn end"
  end

  def decide_first_player
    name = UserInterface::ask_first_player_name(@player1.name, @player2.name, @player1.stone)
    unless compare(name, @player1.name)
      change_turn
      swap_stone(@player1, @player2)
    end
  end

  def change_turn
    @turn = (@turn + 1) % 2
  end

  def swap_stone(p1, p2)
    p1.stone, p2.stone = p2.stone, p1.stone
  end

  def compare(first, second)
    first == second
  end

  def show_board
    @board.display
  end

  def show_winner
    if @winner
      UserInterface::inform_result(@winner.name, @winner.stone)
    else
      UserInterface::inform_result
    end
  end

  def board_valid(position)
    valid_message = 0
    valid_message += 1 unless @board.number?(position)
    if valid_message > 0
      if @board.occupied?(position, @player1.stone, @player2.stone)
        valid_message += 1
      end
    end
    valid_message
  end

  def move(player, position)
    puts "log: stone is #{player.stone}"
    @board.update_state(player.stone, position)
    winner_status_update(player, position)
  end

  def winner_status_update(player, position)
    bWin = false
    for line in WINNING_PERMUTATIONS
      if line.include?(position) &&
            is_fill_same_user?(line, player)
        bWin = true
        set_winner(player)
        break
      end
    end
    puts "log: winner status #{bWin}"
    bWin
  end

  def is_fill_same_user?(arr, player)
    arr.all? { |i| @board.state[i-1] == player.stone }
  end

  def is_winner?
    !@winner.nil?
  end

  def set_winner(player)
    @winner = player
    puts "log: set winner with #{player.name} (#{player.stone})"
  end
end
