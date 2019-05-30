
require "./../lib/ui.rb"

class Player
  attr_accessor :name, :symbol
  def initialize(symbol)
    @name = UserInterface::ask_name
    @symbol = symbol
  end

  def move
    UserInterface::ask_position(@name)
    gets.to_i
  end
end
