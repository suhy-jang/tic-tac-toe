# frozen_string_literal: false

# Board class handles all the board behaviours.
#   It maintains a state; that is grid positions and pieces on them.
#   A consumer can view its state, update its state or call its display method.
require "./../lib/ui.rb"

class Board
  attr_reader :state, :bFull

  BOARD_NUMBERS = (1..9).to_a
  FULL_NUMBER = 9

  def initialize
    @curr_number = 0
    @bFull = false
    @state = (1..9).to_a
  end

  def update_state(game_piece, position)
    puts "log: game_piece is #{game_piece}"
    puts "log: position is #{position}"
    @state[position - 1] = game_piece
    increase_curr_number
    @bFull = curr_num_full?
  end

  def increase_curr_number
    @curr_number += 1
  end

  def curr_num_full?
    @curr_number == FULL_NUMBER
  end

  def is_valid_position?(position)
    return false if out_of_board?(position)
    return false unless empty_place?(position)
    true
  end

  def out_of_board?(num)
    bValid = !(BOARD_NUMBERS.include?(num))
    puts "log: in board? #{BOARD_NUMBERS}"
    UserInterface::throw_wrong_place_error unless bValid
    bValid
  end

  def empty_place?(position)
    bValid = false
    bValid = true if @state[position-1].class == Integer
    puts "log: empty? #{bValid}"
    UserInterface::throw_occupied_error unless bValid
    bValid
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
