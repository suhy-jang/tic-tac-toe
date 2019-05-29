class Game
  attr_reader :winner

  WINNING_PERMUTATIONS =
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].frezze

  def initialize
    @winner = nil
  end

  def move(board_state:, player:, position:)
    response = update_board(board_state, player, position)
    update_game_status(response[:board_state], player) if response[:valid]
    response
  end

  private

  def update_board(board_state, player, position)
    if valid_move?(board_state, position)
      board_state[position - 1] = player.symbol
      return { valid: true, board_state: board_state }
    end
    { valid: false, board_state: board_state }
  end

  def update_game_status(board_state, player)
    game_status = game_over?(board_state, player)
    update_winner(game_status[:winner]) if game_status[:status]
  end

  def valid_move?(board_state, position)
    board_state[position - 1].class == Integer
  end

  def game_over?(board_state, player)
    #Check if game_over (winning or draw)
    #Return { status: , winner: }
  end

  def update_winner(player)
    @winner = player
  end
end
