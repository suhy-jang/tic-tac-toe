class Board
  attr_reader :state
  def initialize()
    @state = (1..9).to_a
  end

  def display
  
  end
  
  private

  def update_state(game_piece, position)
    @state[position - 1] = game_piece
    @state
  end
end