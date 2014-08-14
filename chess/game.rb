require './board'
require './human_player'

class Game
  
  attr_reader :game_board
  
  def initialize()
    @game_board = Board.new
    @player1 = HumanPlayer.new(:W)
    @player2 = HumanPlayer.new(:B)
  end
  
  def display
    letter = 'a'
    print "\n"
    print " "
    (0..7).each { |num| print " #{num.to_s}" }
    print "\n"
    @game_board.board.each do |row|
      # printing here works
      print "#{letter} "
      letter = letter.next
      row.each do |square|
        if square.nil?
          print "_ "
        else
          print "#{square.symbol} "
        end
      end
      puts "\n"
    end
  end
  
  def play
    puts "Welcome, you're playing CHEEESSSS! \n"
    
    until @game_board.checkmate?(@player1.color) || @game_board.checkmate?(@player2.color)
      display
      player1_move = @player1.play_turn
      @game_board.move(player1_move[0], player1_move[1])
      display
      player2_move = @player2.play_turn
      @game_board.move(player2_move[0], player2_move[1])
    end
  end
end


game = Game.new
game.play


