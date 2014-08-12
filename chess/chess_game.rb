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
  
  def moves(direction)
    moves = direction.map do |dx, dy|
      [pos[0]] + dx. pos[1] + dy]
    end.select do |row, col|
      [row, col].all? do |position|
        position.between?(0, @board.grid_size - 1)
        @board[position]
      end
    end
    
    moves.map { |pos| @board[pos] }
  
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
    @moves = moves(MOVES)
  end
end