require 'pry-byebug'

BOARD = {}
(1..9).each { |i| BOARD[i] = ' ' }

def display_board
  puts " #{BOARD[1]} | #{BOARD[2]} | #{BOARD[3]}"
  puts '---+---+---'
  puts " #{BOARD[4]} | #{BOARD[5]} | #{BOARD[6]}"
  puts '---+---+---'
  puts " #{BOARD[7]} | #{BOARD[8]} | #{BOARD[9]}"
  puts ''
end

def player_turn
  display_board
  prompt("which square will you mark?")
  loop do
    puts "1|2|3\n4|5|6\n7|8|9\n\n"
    square = gets.chomp
    if BOARD[square.to_i] == ' '
      BOARD[square.to_i] = 'X'
      break
    else
      prompt('not available. please choose again.')
    end
  end
end

def computer_turn
  square = BOARD.select { |_, v| v == ' ' }.keys.sample
  BOARD[square] = 'O'
end

def tie?
  BOARD.values.none? { |v| v == ' ' }
end

def winner?
  winning_combos = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [7, 5, 3]
  ]
  winning_combos.each do |combo|
    group = ''
    combo.each { |v| group << BOARD[v] }
    return group if group =~ /(XXX|OOO)/
  end
  false
end

def display_winner(winner)
  prompt('YOU WIN!!!') if winner == 'XXX'
  prompt('THE MACHINE RACE WINS!!!') if winner == 'OOO'
  winner
end

def display_tie(tie)
  prompt("YOU'RE BOTH WINNERS!!! (kind of)") if tie
  tie
end

def prompt(str)
  puts "~~> #{str}\n\n"
end

def play_again
  BOARD.each { |k, _v| BOARD[k] = ' ' }
end

loop do
  prompt("let's play TIC TAC TOE!!!")
  turn = 0
  loop do
    turn.even? ? player_turn : computer_turn
    turn += 1
    break if display_winner(winner?)
    break if display_tie(tie?)
  end

  prompt("play again?")
  gets.chomp =~ /(y|yes)/i ? play_again : break
end
prompt("thanks for playing!!")
