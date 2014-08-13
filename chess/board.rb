require './pieces'

class Board
  attr_reader :board
  
  PIECES = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
    set_board
  end
  
  def self.on_board? pos
    pos.all?{ |coord| (0..7).cover? coord }
  end
  
  def set_board

    [0, 7].each do |row|
      PIECES.each_with_index do |klass, index|
        if row == 0
          @board[row][index] = klass.new([row,index], self, :B)
        else
          @board[row][index] = klass.new([row,index], self, :W)
        end
      end
    end
    
    [1, 6].each do |row|
      (0..7).each do |col|
        if row == 1
          @board[row][col] = Pawn.new([row,col], self, :B)
        else
          @board[row][col] = Pawn.new([row,col], self, :W)
        end
      end
    end

  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def in_check?(color) 
    king = find_king(color)
    @board.flatten.compact.any? do |piece|
      piece.color == color && piece.moves.any?{ |move| move == king }
    end
        #
    # (0..7).each do |row|
    #   (0..7).each do |col|
    #     next if self[[row, col]].nil?
    #     next if self[[row, col]].color == color
    #
    #      opposite_piece_moves = self[[row, col]].moves_dir
    #      #self[[row, col]]
    #     opposite_piece_moves.each do |pos|
    #       return true if pos == king
    #     end
    #   end
    # end
    # false
    # can any opponant pcs get him?
  end
  
  def find_king(color)
    (0..7).each do |row|
      (0..7).each do |col|
        position = [row, col]
        if self[[row, col]].symbol == "King" && self[[row, col]].color == color
          return [row, col] 
        end
      end
    end
  end
  
  def move(start, end_pos)
    raise PositionError.new("No ")
  end
end

 p board = Board.new
 position = [0, 2]
 board[position].moves_dir

  board.in_check?(:B)
