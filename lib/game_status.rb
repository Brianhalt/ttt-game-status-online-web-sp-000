# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal1
  [6,4,2], # Diagonal2
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8]  # Right column
]
def won? (board) # asignes each winning combination an index
  WIN_COMBINATIONS.each do |win_combination|
  # for each win_combination in WIN_COMBINATIONS
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
  # bring in the board
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if empty?(board) == true
      return false
    elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination  #return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination  #return the win_combination indexes that won.
    elsif full?(board) == true
      return false
    else
      false
    end
  end
end

def empty? (board)
  board.all? do |position|
    position == " " || position == ""
  end
end


def full? (board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw? (board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner?(board)
  if won?(board) == true
    return true
  else
    return false
  end
end
