class Game
  attr_reader :next_turn, :winner

  def initialize(user=0)
    @next_turn=user
  end

  def move(player,grid_num)
    #valid? or invalid? -> doing something
  end

  private
  def game_over?
    #set_winner
  end

  def set_winner
  end
end
