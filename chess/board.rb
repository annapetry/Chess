require './pieces'
require './exceptions'

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
      piece.color == color && piece.moves_dir.any?{ |move| move == king }
    end

  end
  
  def find_king(color)
    self.color(color).find { |pc| pc.is_a?(King) }
  end
  
  def color(color)
    @board.flatten.compact.select { |pc| pc.color == color }
  end
  
  def move(start, end_pos)
    begin
      if self[start].nil?
        raise PositionError.new("No piece to move at that position!")
      end
      if self[start].moves_dir.include?(end_pos)
        self[start].pos = end_pos
      else
        raise PositionError.new("Not a valid move")
      end
    rescue PositionError => error
      puts error.message
    end
  end
end

 board = Board.new
 position = [0, 0]
 board[position].moves_dir

 board.find_king(:B)
 
 board.move([0, 0], [6, 0])
