class HumanPlayer
  attr_reader :color, :name
  
  ROWS = {
    'a' => 0,
    'b' => 1,
    'c' => 2,
    'd' => 3,
    'e' => 4,
    'f' => 5,
    'g' => 6,
    'h' => 7,
  }
  
  def initialize(color)
    @color = color
  end
  
  def play_turn
    puts "\nIt is #{@color}'s turn. Pick a piece to move"
    p_from = gets.chomp.split("")
    puts "Pick a place to move."
    p_to = gets.chomp.split("")
    
    start_pos = [(ROWS[p_from[0]]), p_from[1].to_i]
    end_pos = [(ROWS[p_to[0]]), p_to[1].to_i]
    [start_pos, end_pos]
  end
end