# frozen_string_literal: true

# Game class handles all the game logic
#   It accepts board_state, player & position as inputs via its move interface.
#   Then validates the move & returns the resulting board state to the caller.
#   It checks game status after every valid move, when game over;
#   it updates @winner unless draw.
class Game
  WINNING_PERMUTATIONS =
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_reader :winner

  def self.info
    puts "-----------------------------------------------------------------".center(80)
    puts ""
    puts "Tic Tac Toe is a paper-and-pencil game for two players, X and O, ".center(80)
    puts ""
    puts "who take turns marking the spaces in a 3×3 grid.".center(80)
    puts ""
    puts "The player who succeeds in placing three of their marks in a ".center(80)
    puts ""
    puts "horizontal, vertical, or diagonal row wins the game.".center(80)
    puts ""
    puts "-----------------------------------------------------------------".center(80)
  end

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
    #Return { status: true/false, winner: player object / DRAW }
  end

  def update_winner(player)
    @winner = player
  end
end
