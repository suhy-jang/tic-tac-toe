class Board
  attr_reader :state

  def initialize()
    @state = (1..9).to_a
  end

  def display
    board=""
    line="-------------\n".rjust(55)
    row1="| #{state[0]} | #{state[1]} | #{state[2]} |\n".rjust(55)
    row2="| #{state[3]} | #{state[4]} | #{state[5]} |\n".rjust(55)
    row3="| #{state[6]} | #{state[7]} | #{state[8]} |\n".rjust(55)
    board << line << row1 << line << row2 << line << row3 << line
    puts board
  end

  private

  def update_state(game_piece, position)
    @state[position - 1] = game_piece
    @state
  end
end

b=Board.new
b.display
