require './piece'

class SteppingPiece < Piece  
  
  def moves(direction)
    valid_moves = []
    direction.each do |(dx, dy)|
      next_square = [pos[0] + dx, pos[1] + dy]
      break unless Board.on_board?(next_square)
      if @board[next_square].nil?
        valid_moves << next_square
      elsif @board[next_square].color != self.color
        valid_moves << next_square if @board
      end
    end
    
    valid_moves
  end
end

