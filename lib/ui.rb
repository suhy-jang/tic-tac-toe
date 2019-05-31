
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
      print "player #{num} name: ".rjust(50)
      user_input = gets.chomp
      unless "" == user_input
        break
      else
        type_again
      end
    end
    user_input
  end

  def self.type_again
    puts "Please type again right value !!".rjust(50)
  end

  def self.ask_first_player_name(p1_name, p2_name, symbol)
    status = 0
    puts "Who will do first?(#{symbol} stone)".rjust(50)
    until status > 0
      print "Type the name: ".rjust(50)
      name = gets.chomp
      status = 1 if p1_name == name
      status = 2 if p2_name == name
      type_again unless status > 0
    end
    (1 == status)? p1_name : p2_name
  end

  def self.ask_position(name, stone)
    print "[ '#{name}' turn! ]\n".rjust(50)
    print "Where would you like to put your stone (#{stone})?: ".rjust(50)
    gets.chomp.to_i
  end

  def self.inform_result(winner_name = nil, winner_stone = nil)
    puts "Game end".rjust(50)
    if winner_name.nil?
      puts "Tie".rjust(50)
    else
      puts "[ '#{winner_name}' (#{winner_stone}) Won! ]".rjust(50)
    end
  end

  def self.throw_wrong_place_error(position = nil)
   puts "#{position} already occupied!".rjust(50) if position
   puts "Please input a correct (not occupied) number 1 and 9".rjust(50)
  end

  def self.inform_success
    puts "success! ".rjust(50)
  end
end
