
class GameLogic

  require_relative "board"
  require_relative "player"

  WIN_COMBO = [
    [0, 4, 8], 
    [2, 4, 6], 
    [0, 1, 2], 
    [3, 4, 5],
    [6, 7, 8], 
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8]
             ]

  def initialize(player = Player.new("X"), computer = Player.new("O"), board = Board.new)
    @player = player
    @computer = computer
    @board = board
    player_turn()
  end

  def computer_turn
    return if @board.full_board? || game_over?
    no_spot = true
    while no_spot
     choice = rand(@board.board_array.length - 1)
       if @board.valid_move?(choice)
          no_spot = false
          @board.mark_spot(choice, @computer.player_icon)
          @board.print_board
          player_turn()
        end
    end
  end
  
  def player_turn
    return if @board.full_board? || game_over?
    p "Choose a spot to place your icon"
    choice = gets.chomp.to_i - 1
      if @board.valid_move?(choice)
        @board.mark_spot(choice, @player.player_icon)
        @board.print_board
        computer_turn()
      else
      p "Spot taken try again"
        player_turn()
      end
  end

   def game_over?
    won? || draw?
  end

  def won?
    winner_icons = WIN_COMBO.detect do |winner_icons|
      unless @board.board_array[winner_icons[0]] == ""
        @board.board_array[winner_icons[0]] == @board.board_array[winner_icons[1]] &&
        @board.board_array[winner_icons[1]] == @board.board_array[winner_icons[2]]
      end
    end
      if winner_icons.nil?
        return false
      else
        present_result(@board.board_array[winner_icons[0]])
        return true
      end
  end

  def present_result (winner_icons)
      if winner_icons == "X"
        p "Player has won"
      else
        p "Computer has won"
      end
  end

  def draw?
   if @board.full_board? && !won?
    p "it's a draw!"
   end
  end

end


mygame = GameLogic.new


