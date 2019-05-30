
module UserInterface
  def self.inform_begin_message
    border = "-----------------------------------------------------------------".center(80)
    line1 = "Tic Tac Toe is a paper-and-pencil game for two players, X and O, ".center(80)
    line2 = "who take turns marking the spaces in a 3×3 grid.".center(80)
    line3 = "The player who succeeds in placing three of their marks in a ".center(80)
    line4 = "horizontal, vertical, or diagonal row wins the game.".center(80)
    puts border, line1, line2, line3, line4, border
  end

  def self.ask_name
    print "Type user's name: ".rjust(50)
    gets.chomp
  end

  def self.ask_position(str_player)
    print "#{str_player}, Where to put? ".rjust(50)
    gets.chomp.to_i
  end

  def self.ask_who_first(p1,p2)
    status = 0
    until status > 0
      print "Who will do first?(name) "
      name = gets.chomp
      status = 1 if p1 == name
      status = 2 if p2 == name
    end
    (1==status)? p1:p2
  end

  def self.inform_occ_position(position)
    puts "#{position} was already occupied".rjust(50)
  end

  def self.inform_result(winner=nil)
    unless winner.nil?
      puts "Winner is #{winner}"
    else
      puts "Tie"
    end
  end

  def self.throw_wrong_place_error
    puts "Input between 1~9"
  end

  def self.throw_occupied_error
    puts "It was already occupied position"
  end
end
