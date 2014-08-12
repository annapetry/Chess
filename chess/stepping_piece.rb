require './piece'

class SteppingPiece < Piece  
  
  def moves(direction)
    valid_moves = []
    direction.each do |(dx, dy)|
      new_square = [pos[0] + dx, pos[1] + dy]
      
      if @board[next_square].nil?
        valid_moves << next_square
      elsif @board[next_square].color != self.color
        valid_moves << next_square if @board
      end
    end
    
    valid_moves.select do |row, col|
      [row, col].all? do |pos|
        pos.between?(0, 7)
      end
    end
  end
end

