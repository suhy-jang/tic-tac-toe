
require "./../lib/ui.rb"

class Player
  attr_accessor :name, :stone
  def initialize(stone)
    @name = UserInterface::ask_name
    @stone = stone
  end
end
