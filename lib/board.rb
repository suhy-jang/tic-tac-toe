# frozen_string_literal: false

# Board class handles all the board behaviours.
#   It maintains a state; that is grid positions and pieces on them.
#   A consumer can view its state, update its state or call its display method.
require "./../lib/ui.rb"

class Board
  attr_reader :state

  def initialize
    @occupy_num = 0
    @state = (1..9).to_a
  end

  def full?
    @state.length == @occupy_num
  end

  def update_state(game_piece, position)
    puts "log: update state #{game_piece}, #{position}"
    @state[position - 1] = game_piece
    increase_occupy_num
  end

  def in_range?(position)
    (1..9).inculde? position
  end

  def occupied?(position)
    @state[position - 1].class != Integer
  end

  def display
    board = ""
    line = "+-------+-------+-------+\n".rjust(55)
    wall = "|       |       |       |\n".rjust(55)
    row1 = "|   #{state[0]}   |   #{state[1]}   |   #{state[2]}   |\n".rjust(55)
    row2 = "|   #{state[3]}   |   #{state[4]}   |   #{state[5]}   |\n".rjust(55)
    row3 = "|   #{state[6]}   |   #{state[7]}   |   #{state[8]}   |\n".rjust(55)
    board << line << wall << row1 << wall
    board << line << wall << row2 << wall
    board << line << wall << row3 << wall << line
    puts board
  end

  private

  def increase_occupy_num
    @occupy_num += 1
  end
end
