class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count()
    @board.count{|xo| xo == "X" || xo == "O"}
  end

  def current_player()
    return turn_count.even? ? "X" : "O"
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    user_input = input_to_index(input)
    if valid_move?(user_input)
      move(user_input, current_player())
      display_board()
      return
    end
    turn()
  end

  def won?()
    WIN_COMBINATIONS.each do |combination|
        win_index_1 = combination[0]
        win_index_2 = combination[1]
        win_index_3 = combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return combination
        end
        if position_1 == "O" && position_2 == "O" && position_3 == "O"
          return combination
        end
    end
    return false
  end

  def full?(board)
    for i in(0..8)
      if !position_taken?(i)
        return false
      end
    end
    return true
  end
end
