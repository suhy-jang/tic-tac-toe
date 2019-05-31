
module UserInterface
  def self.inform_begin_message
    border = "-----------------------------------------------------------------".center(80)
    line1 = "Tic Tac Toe is a paper-and-pencil game for two players, X and O, ".center(80)
    line2 = "who take turns marking the spaces in a 3×3 grid.".center(80)
    line3 = "The player who succeeds in placing three of their marks in a ".center(80)
    line4 = "horizontal, vertical, or diagonal row wins the game.".center(80)
    puts border, line1, line2, line3, line4, border
  end

  def self.ask_name(num)
    user_input = ""
    loop do
      print "Player #{num} name: ".rjust(50)
      user_input = gets.chomp
      type_again if user_input.empty? || user_input.scan(/[a-zA-Z]/).empty?
      break
    end
    user_input.upcase
  end

  def self.type_again
    puts "Please type in your name!".rjust(50)
  end

  def self.ask_first_player_name(p1_name, p2_name, symbol)
    puts "Who wants to play first?(#{symbol} stone)".rjust(50)
    name = nil
    loop do
      print "Type the name: ".rjust(50)
      name = gets.chomp.upcase
      break if [p1_name, p2_name].include?(name)
    end
    name
  end

  def self.ask_position(name, stone)
    print "[ #{name}'s turn! ]\n".rjust(50)
    print "Where would you like to put your stone (#{stone})?: ".rjust(50)
    gets.chomp.to_i
  end

  def self.inform_result(winner_name = nil, winner_stone = nil)
    puts "Game Over!".rjust(50)
    return puts "Tie!".rjust(50) if winner_name.nil?
    puts "[ #{winner_name} (#{winner_stone}) WON! ]".rjust(50)
  end

  def self.throw_wrong_place_error(position = nil)
   return puts "#{position} already occupied!".rjust(50) if position
   puts "Please input a correct (not occupied) number 1 and 9".rjust(50)
  end

  def self.inform_success
    puts "Success! ".rjust(50)
  end
end