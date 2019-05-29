class Game
  attr_reader :winner

  WINNING_PERMUTATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
		[1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]
  
  def initialize
    @winner = nil
  end

  def move(board:, player:, position:)
    #valid? or invalid? -> doing something
  end

  private

  def game_over?(board:)
    #set_winner
  end

  def set_winner
    #Use WINNING_PERMUTATIONS to determine winner
  end
end
