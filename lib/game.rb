class Game
  WINNING_PERMUTATIONS = [
    [1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[3,5,7]
  ].freeze

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = nil
    @turn = 0
  end

  def game_start
    decide_first_player
    show_board
    until @board.full? || @winner
      @turn.zero? ? play(@player1) : play(@player2)
      change_turn
    end
    show_board
    show_winner
  end

  private

  def process_valid_response(player, position)
    move(player, position)
    show_board
    UserInterface::inform_success
  end

  def process_invalid_response(response, position)
    show_board
    UserInterface::throw_wrong_place_error if response == 1
    UserInterface::throw_wrong_place_error(position) if response == 2
  end

  def play(player)
    loop do
      position = UserInterface::ask_position(player.name, player.stone)
      response = board_valid(position)
      process_invalid_response(response, position) unless response.zero?
      if response.zero?
        process_valid_response(player, position)
        break
      end
    end
  end

  def decide_first_player
    name = UserInterface::ask_first_player_name(@player1.name, @player2.name, @player1.stone)

    unless compare(name, @player1.name)
      change_turn
      swap_stone(@player1, @player2)
    end
  end

  def change_turn
    @turn = @turn == 1 ? 0 : 1
  end

  def swap_stone(player1, player2)
    player1.stone, player2.stone = player2.stone, player1.stone
  end

  def compare(first, second)
    first == second
  end

  def show_board
    @board.display
  end

  def show_winner
    return UserInterface::inform_result(@winner.name, @winner.stone) if @winner
    UserInterface::inform_result
  end

  def board_valid(position)
    return 1 unless @board.in_range?(position)
    return 2 if @board.occupied?(position)
    0
  end

  def move(player, position)
    @board.update_state(player.stone, position)
    winner_status_update(player)
  end

  def winner_status_update(player)
    player_positions = []
    @board.state.each_with_index { |x, idx| player_positions << idx + 1 if x == player.stone }
    WINNING_PERMUTATIONS.each do |winning_case|
      if (player_positions & winning_case).length == 3
        @winner = player
        break
      end
    end
  end

end
