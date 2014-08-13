class Piece
  attr_reader :pos, :color, :moves
  
  DIAGS = [
       [-1, 1],   # top left
       [1, -1],   # bottom right
       [-1, -1],  # bottome left
       [1, 1]     # top right
     ]    
           
  ORTH  = [
       [0, 1],    # up
       [1, 0],    # right
       [0, -1],   # down
       [-1, 0]    # left
     ]            
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
    @moves = []
  end
  
  def inspect
    { :pos => pos,
      :symbol => symbol,
      :color => color}.inspect
  end
  

end




