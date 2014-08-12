require './piece'

class SlidingPiece < Piece
  
  def moves(direction)
    valid_moves = []
    direction.each do |dx, dy|
      loop do 
        next_square = [pos[0] + dx, pos[1] + dy]
        if @board[next_square].nil?
          valid_moves << next_square
        elsif @board[next_square].color == self.color
          break
        else
          valid_moves << next_square
          break
        end
      end
    end
    
    valid_moves.select do |row, col|
      [row, col].all? do |pos|
        pos.between?(0, 7)
      end
    end
    
  end
end

