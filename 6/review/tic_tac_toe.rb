require 'byebug'
=begin
flow:
welcome/config (piece, who goes first)
display score
display board
get player move
update board
check if winner
get cpu move
update board
check if winner
display win message when winner
=end
def prompt(str)
  puts "~> #{str}"
end

def clear_screen
  system('clear') || system('cls')
end

def setup
  clear_screen
  prompt("howdy ho! welcome to ye old tic tac toe, Mo!")
  prompt("choose your board size. input 3 for 3x3, 5 for 5x5, etc.")
  board_side = gets.to_i
  prompt("input a single char of your choosing for your marker")
  user = gets.chomp.upcase
  cpu = user == 'X' ? 'O' : 'X'
  prompt('who should move first in the first round? input an even num for you or an odd for cpu')
  user_turn = gets.to_i.even?
  prompt("great! the first to 5 victories is the grand champion! let's go!\n")
  prompt("press enter to continue ;)")
  gets
  [board_side, user, cpu, user_turn]
end

def display_score(scores)
  clear_screen
  scores.each { |k, v| puts "#{k}: #{v}" }
  puts "#{"\n" * 2}"
end

def display_board(board_vals)
  board = []
  BOARD_SIDE.times { board << '' }
  BOARD_SIDE.times do |row|
    (1..BOARD_SIDE).each do |square|
      square += BOARD_SIDE * row
      board[row] << " #{board_vals[square]} |"
    end
  end

  board.map!(&:chop)
  partition = ('---+' * BOARD_SIDE).chop
  (BOARD_SIDE).times do |row|
    puts board[row]
    puts partition unless row == BOARD_SIDE - 1
  end
end

def get_user_move(board_vals)
  valid_moves = board_vals.select { |_, v| v == ' ' }.keys
  loop do 
    prompt("mark one of these squares: #{valid_moves.join(', ')}")
    choice = gets.to_i 
    break choice if valid_moves.include?(choice)
    prompt('invalid selection. try again.')
  end
end

def get_cpu_move(board_vals)
  board_vals.select { |_, v| v == ' ' }.keys.sample
end

def update_board(move, user_turn, board_vals)
  board_vals[move] = user_turn ? USER : CPU
end

def get_winner(board_vals)
  h_win = horizontal_win(board_vals)
  v_win = vertical_win(board_vals)
  d_win = diagonal_win(board_vals)
  win = [h_win, v_win, d_win].delete(nil)
  win.empty? nil : win[0]
end

def horizontal_win(board_vals)
  byebug
  win_condition = [USER * BOARD_SIDE, CPU * BOARD_SIDE]
  squares = board_vals.keys
  rows = []
  BOARD_SIDE.times { rows << squares.shift(BOARD_SIDE).map { |v| board_vals[v] } }
  rows.each { |row| return row[0] if win_condition.include?(row.join) }
  nil
end

def vertical_win(board_vals)
  
end

# start
BOARD_SIDE, USER, CPU, user_turn = setup
board_vals = Hash.new
(1..BOARD_SIDE**2).each { |i| board_vals[i] = ' ' }
scores = {'user' => 0, 'cpu' => 0}

loop do
  display_score(scores)
  display_board(board_vals)

  move = user_turn ? get_user_move(board_vals) : get_cpu_move(board_vals)
  update_board(move, user_turn, board_vals)
  user_turn = !user_turn
  get_winner(board_vals)
=begin
  winner = get_winner(board_vals)
  if winner
    update_scores(winner) 
    display_winner(winner)
  end
  if scores.value?(5)
    display_grand_winner(scores)
    break unless play_again?
  end
=end
end
prompt("thanks for playing :3")