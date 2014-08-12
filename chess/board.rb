require './pieces'

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    set_board
  end
  
  def set_board
    
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
end

p Board.new