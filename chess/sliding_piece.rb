require './piece'


class SlidingPiece < Piece

  def moves(direction)
    valid_moves = []
    direction.each do |dx, dy|
      counter = 1
      loop do 
        next_square = [pos[0] + (dx * counter), pos[1] + (dy * counter)]
        break if !Board.on_board?(next_square)
        if @board[next_square].nil?
          valid_moves << next_square unless valid_moves.include?(next_square)
          
        elsif @board[next_square].color == self.color
          break
        else
          valid_moves << next_square unless valid_moves.include?(next_square)
          break
        end
        counter += 1
      end
    end
     valid_moves
  end
end

