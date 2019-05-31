# frozen_string_literal: false

# Board class handles all the board behaviours.
#   It maintains a state; that is grid positions and pieces on them.
#   A consumer can view its state, update its state or call its display method.
require "./../lib/ui.rb"

class Board
  attr_reader :state

  BOARD_NUMBERS = (1..9).to_a

  def initialize
    @occupy_num = 0
    @state = BOARD_NUMBERS
  end

  self

  def update_state(game_piece, position)
    puts "log: game_piece is #{game_piece}"
    puts "log: position is #{position}"
    @state[position - 1] = game_piece
    display
    increase_occupy_num
  end

  def full?
    BOARD_NUMBERS.length == @occupy_num
  end

  def increase_occupy_num
    @occupy_num += 1
  end

  def is_valid_position?(position)
    display
    return false if out_of_board?(position)
    return false unless empty_place?(position)
    puts "log: it is valid board"
    true
  end

  def out_of_board?(num)
    b_out_place = !(BOARD_NUMBERS.include?(num))
    UserInterface::throw_wrong_place_error if b_out_place
    b_out_place
  end

  def empty_place?(position)
    b_empty = @state[position-1].class == Integer ? true : false
    UserInterface::throw_occupied_error unless b_empty
    b_empty
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
end
