require './sliding_piece'
require './stepping_piece'

class Bishop < SlidingPiece
           
  def moves_dir
    moves(DIAGS)
  end
end

class Rook < SlidingPiece
  
  def moves_dir
    moves(ORTH)
  end
end

class Queen < SlidingPiece
  
  def moves_dir
    moves(DIAGS.concat(ORTH))
  end
end

class Knight < SteppingPiece
  KNIGHT = [
      [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1]
    ]
    
  def moves_dir
    moves(KNIGHT)
  end
end

class King < SteppingPiece
  def moves_dir
    moves(DIAGS.concat(ORTH))
  end
end