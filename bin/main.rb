require "./../lib/board.rb"
require "./../lib/game.rb"
require "./../lib/player.rb"
require "./../lib/ui.rb"

STONE_1 = :O
STONE_2 = :X

def main
  UserInterface::inform_begin_message
  player1 = Player.new(UserInterface::ask_name(1), STONE_1)
  player2 = Player.new(UserInterface::ask_name(2), STONE_2)
  puts "log: #{player1.name}, #{player2.name} is playing"
  board = Board.new
  game = Game.new(player1,player2,board)
  game.game_start
end

main
