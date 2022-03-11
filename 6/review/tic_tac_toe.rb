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


def setup
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
  [board_side, user, cpu]
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

def display_score(scores)


BOARD_SIDE, USER, CPU = setup
board_vals = Hash.new
(1..BOARD_SIDE**2).each { |i| board_vals[i] = ' ' }
scores = {'user' => 0, 'cpu' => 0}
loop do
  # display_score
  display_board(board_vals)
  update_board(get_player_move, board_vals)
  check
end