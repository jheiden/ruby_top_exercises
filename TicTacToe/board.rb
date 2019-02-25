
class Board
  attr_accessor :board, :board_array
  
  def initialize
    reset_board()
  end

  def print_board
    p " #{@board_array[0]}  | #{@board_array[1]}  |  #{@board_array[2]} "
    p "___________"
    p " #{@board_array[3]}  | #{@board_array[4]}  |  #{@board_array[5]} "
    p "___________"
    p " #{@board_array[6]}  | #{@board_array[7]}  |  #{@board_array[8]} "
  end
 
   def valid_move? (choice)
    return true if !full_board? && spot_free?(choice) && choice.between?(0,8)
  end

  def spot_free? choice
    return @board_array[choice] == ""
  end

  def mark_spot (choice, icon)
    @board_array[choice] = icon
  end

  def reset_board
    @board_array = Array.new(9, "")
  end

  def full_board?
    return @board_array.all? {|char| char == "X" && char == "O"}
  end

end # END OF CLASS