require "./../lib/board.rb"
require "./../lib/game.rb"
require "./../lib/player.rb"
require "./../lib/ui.rb"

STONE_1 = :O
STONE_2 = :X

def main
  UserInterface::inform_begin_message
  player1 = Player.new(STONE_1)
  player2 = Player.new(STONE_2)
  board = Board.new
  game = Game.new(player1,player2,board)
  game.game_start
  game.game_end
end

main
