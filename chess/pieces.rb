require './sliding_piece'
require './stepping_piece'

class Bishop < SlidingPiece
  
  def moves_dir
    moves(DIAGS)
  end
  
  def symbol
    if color == :B
      "\u265D"
    else
      "\u2657"
    end
  end
end

class Rook < SlidingPiece
  
  def moves_dir
    moves(ORTH)
  end
  
  def symbol
    if color == :B
      "\u265C"
    else
      "\u2656"
    end
  end
end

class Queen < SlidingPiece
  
  def moves_dir
    moves(DIAGS.concat(ORTH))
  end
  
  def symbol
    if color == :B
      "\u265B"
    else
      "\u2655"
    end
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
  
  def symbol
    if color == :B
      "\u265E"
    else
      "\u2658"
    end
  end
  
end

class King < SteppingPiece
  def moves_dir
    moves(DIAGS.concat(ORTH))
  end
  
  def symbol
    if color == :B
      "\u265A"
    else
      "\u2654"
    end
  end
end

class Pawn < Piece
  PAWNB = [
    [1, 0],
    [1, -1],
    [1, 1],
  ] 
  
  PAWNW = [
    [-1, 0],
    [-1, 1],
    [-1, -1]
  ]
  
  def moves_dir
    if self.color == :B
      moves(PAWNB)
    else
      moves(PAWNW)
    end
  end
  
  def moves(direction)
    valid_moves = []
    direction.each do |(dx, dy)|
      next_square = [pos[0] + dx, pos[1] + dy]
      break if !Board.on_board?(next_square)
      
      if dy != 0
        next if @board[next_square].nil?
        valid_moves << next_square if @board[next_square].color != self.color
      else        
        valid_moves << next_square if @board[next_square].nil?   
      end
    end
    valid_moves
  end
  
  def symbol
    if color == :B
      "\u265F"
    else
      "\u2659"
    end
  end
end