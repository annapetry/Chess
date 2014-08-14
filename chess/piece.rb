class Piece
  attr_accessor :pos
  attr_reader :color, :moves
  
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
  end
  
  def inspect
    { :pos => pos,
      :symbol => symbol,
      :color => color}.inspect
  end
  
  def move_into_check?(end_pos)
    duped_board = @board.deep_dup
    duped_board.move!(self.pos, end_pos)
    duped_board.in_check?(self.color)
  end
  
end




