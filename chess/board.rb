require './pieces'
require './exceptions'

class Board
  attr_reader :board
  
  PIECES = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
  
  def initialize(pop = true)
    @board = Array.new(8) { Array.new(8) }
    set_board if pop
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
      # NEED TO CHANGE THIS TO FIND KING IN MOVES ARRY
      piece.color != color && 
      piece.moves_dir.any?{ |pos| @board[pos[0]][pos[1]].is_a?(King) }
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
      elsif self[start].moves_dir.include?(end_pos)
        if self[start].move_into_check?(end_pos)
          raise PositionError.new("This move will put you into check.")
        else
          self[start].pos = end_pos
          @board[end_pos[0]][end_pos[1]] = self[start]
          @board[start[0]][start[1]] = nil
        end
      else
        raise PositionError.new("Not a valid move")
      end
    rescue PositionError => error
      puts error.message
    end
  end
  
  def move!(start, end_pos)
    if self[start].nil?
      raise PositionError.new("No piece to move at that position!")
    elsif self[start].moves_dir.include?(end_pos)
      self[start].pos = end_pos
      @board[end_pos[0]][end_pos[1]] = self[start]
      @board[start[0]][start[1]] = nil
    end 
  end
  
  def deep_dup
    duped = Board.new(false)
    
    @board.flatten.compact.each do |piece|
      new_piece = piece.class.new(piece.pos.dup, duped, piece.color)
      duped.board[piece.pos[0]][piece.pos[1]] = new_piece
    end
    
    duped
  end
  
  def checkmate?(color)
    if in_check?(color)
      team = color(color)
      team.each do |piece|
        piece.moves_dir.each do |pos|
          return false unless piece.move_into_check?(pos) 
        end
      end
      true
    else
      false
    end
  end
end

  board = Board.new(false)
  board.board[2][4] = King.new([2, 4], board, :W)
  board.board[0][5] = Rook.new([0, 5], board, :B)
  board.board[1][5] = Rook.new([1, 5], board, :B) 
  # board.move([6, 3], [5, 3])
  
  p board.checkmate?(:W)