require 'byebug'
=begin
to do:
flip who begins each round
catscratch
validate input
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
  prompt("great! the first to #{GRAND_WINS} victories is the grand champion! let's go!\n")
  prompt("press enter to continue ;)")
  gets
  [board_side, user, cpu, user_turn]
end

def display_score(scores)
  clear_screen
  scores.each { |k, v| puts "#{k}: #{v}" }
  puts "\n" * 2
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
  win = [h_win, v_win, d_win]
  win.delete(nil)
  win.empty? ? nil : win[0]
end

def horizontal_win(board_vals)
  win_conditions = [USER * BOARD_SIDE, CPU * BOARD_SIDE]
  squares = board_vals.keys
  rows = []
  BOARD_SIDE.times do
    rows << squares.shift(BOARD_SIDE).map do |v|
      board_vals[v]
    end
  end
  rows.each { |row| return row[0] if win_conditions.include?(row.join) }
  nil
end

def vertical_win(board_vals)
  win_conditions = [USER * BOARD_SIDE, CPU * BOARD_SIDE]
  columns = []
  (1..BOARD_SIDE).each do |col|
    group = ''
    BOARD_SIDE.times do |row|
      group << board_vals[col + BOARD_SIDE * row]
    end
    columns << group
  end
  columns.each { |col| return col[0] if win_conditions.include?(col) }
  nil
end

def diagonal_win(board_vals)
  win_conditions = [USER * BOARD_SIDE, CPU * BOARD_SIDE]
  diagonals = ['', '']
  BOARD_SIDE.times do |i|
    diagonals[0] << board_vals[1 + i + (i * BOARD_SIDE)]
    diagonals[1] << board_vals[BOARD_SIDE - i + (i * BOARD_SIDE)]
  end
  diagonals.each { |dag| return dag[0] if win_conditions.include?(dag) }
  nil
end

def update_scores(scores, winner)
  scores[winner] += 1
end

def display_winner(winner)
  clear_screen
  case winner
  when USER then prompt('you win the round!')
  when CPU then prompt('the computer wins the round!')
  end
  prompt('press enter to continue :)')
  gets
end

def reset_board(board_vals)
  (1..BOARD_SIDE**2).each { |i| board_vals[i] = ' ' }
end

def display_grand_winner(scores)
  case scores[USER]
  when GRAND_WINS then prompt('the cpu is a towel! you are the GRAND CHAMPION!')
  else prompt("no, you're a towel! the cpu is the GRAND CHAMPION!")
  end
end

def play_again?(scores, board_vals)
  prompt("play another game? enter 'y' for yes or anything else to quit")
  return false unless gets.chomp.downcase == 'y'

  scores.each { |k, _| scores[k] = 0 }
  reset_board(board_vals)
end

def tie?(board_vals)
  !board_vals.values.include?(' ')
end

# start
GRAND_WINS = 1
BOARD_SIDE, USER, CPU, user_turn = setup
board_vals = Hash.new
(1..BOARD_SIDE**2).each { |i| board_vals[i] = ' ' }
scores = { USER => 0, CPU => 0 }

loop do
  display_score(scores)
  display_board(board_vals)

  move = user_turn ? get_user_move(board_vals) : get_cpu_move(board_vals)
  update_board(move, user_turn, board_vals)
  user_turn = !user_turn

  winner = get_winner(board_vals)
  if winner
    update_scores(scores, winner)
    display_winner(winner)
    reset_board(board_vals)
  end
  if scores.value?(GRAND_WINS)
    display_grand_winner(scores)
    break unless play_again?(scores, board_vals)
  end
  if tie?(board_vals)
    prompt("this round's a tie! press enter to continue.")
    gets
    reset_board(board_vals)
  end
end
prompt("thanks for playing :3")
