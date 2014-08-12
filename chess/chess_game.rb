class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end
  
  ### make board wil nil and pieces
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
end

class Piece
  attr_reader :pos, :color, :moves
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
    @moves = []
  end
end

class SlidingPiece < Piece
  
  DIAGS = [[-1, 1],   # top left
           [1, -1],   # bottom right
           [-1, -1],  # bottome left
           [1, 1]]    # top right
           
  ORTH  = [[0, 1],    # up
           [1, 0],    # right
           [0, -1],   # down
           [-1, 0]]   # left
  
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
    end.map { |pos| @board[pos] }
    
  end
  
  def check_position
    @moves.select do |coord|
      if @board[coord].nil?
        # store
      elsif @board[coord].color == self.color
        # don't store
      else
    end
  end
end

class Bishop < SlidingPiece
           
  def moves_dir
    @moves = moves(DIAGS)
  end
end

class Rook < SlidingPiece
  
  def moves_dir
    @moves = moves(ORTH)
  end
end

class Queen < SlidingPiece
  
  def moves_dir
    @moves = moves(DIAGS.concat(ORTH))
  end
end





