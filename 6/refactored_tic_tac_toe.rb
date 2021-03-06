require 'pry-byebug'

VICTORY = <<-'MSG'
___________________________________________________________________________________________
 ___________________________________________________________________________________________
  ________________/\\\___________________/\\\_____________________________________/\\\__/\\\_
   __/\\\____/\\\_\///______/\\\\\\\\__/\\\\\\\\\\\_____/\\\\\_____/\\/\\\\\\\____\//\\\/\\\__
    _\//\\\__/\\\___/\\\___/\\\//////__\////\\\////____/\\\///\\\__\/\\\/////\\\____\//\\\\\___
     __\//\\\/\\\___\/\\\__/\\\____________\/\\\_______/\\\__\//\\\_\/\\\___\///______\//\\\____
      ___\//\\\\\____\/\\\_\//\\\___________\/\\\_/\\__\//\\\__/\\\__\/\\\__________/\\_/\\\_____
       ____\//\\\_____\/\\\__\///\\\\\\\\____\//\\\\\____\///\\\\\/___\/\\\_________\//\\\\/______
        _____\///______\///_____\////////______\/////_______\/////_____\///___________\////________

MSG

DEFEAT = <<-'MSG'
 ______   _______  _______  _______  _______  _______
|      | |       ||       ||       ||   _   ||       |
|  _    ||    ___||    ___||    ___||  |_|  ||_     _|
| | |   ||   |___ |   |___ |   |___ |       |  |   |
| |_|   ||    ___||    ___||    ___||       |  |   |
|       ||   |___ |   |    |   |___ |   _   |  |   |
|______| |_______||___|    |_______||__| |__|  |___|

MSG

YOU = <<-'MSG'
 __     ______  _    _
 \ \   / / __ \| |  | |  _
  \ \_/ / |  | | |  | | (_)
   \   /| |  | | |  | |
    | | | |__| | |__| |  _
    |_|  \____/ \____/  (_)


MSG

CPU = <<-'MSG'
   _____ _____  _    _
  / ____|  __ \| |  | |  _
 | |    | |__) | |  | | (_)
 | |    |  ___/| |  | |
 | |____| |    | |__| |  _
  \_____|_|     \____/  (_)


MSG

ZERO = <<-'MSG'
   ___
  / _ \
 | | | |
 | | | |
 | |_| |
  \___/


MSG

ONE = <<-'MSG'
  __
 /_ |
  | |
  | |
  | |
  |_|


MSG

TWO = <<-'MSG'
  ___
 |__ \
    ) |
   / /
  / /_
 |____|


MSG

THREE = <<-'MSG'
  ____
 |___ \
   __) |
  |__ <
  ___) |
 |____/


MSG

FOUR = <<-'MSG'
  _  _
 | || |
 | || |_
 |__   _|
    | |
    |_|


MSG

FIVE = <<-'MSG'
  _____
 | ____|
 | |__
 |___ \
  ___) |
 |____/


MSG

ASCII_NUMS = {
  1 => ONE,
  2 => TWO,
  3 => THREE,
  4 => FOUR,
  5 => FIVE
}

BOARD = {}
(1..9).each { |i| BOARD[i] = ' ' }

WINNING_COMBOS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [7, 5, 3]
]

PLAYER = 'X'
CPU = 'O'

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
      BOARD[square.to_i] = PLAYER
      break
    else
      prompt('not available. please choose again.')
    end
  end
end

def computer_turn
  square = BOARD.select { |_, v| v == ' ' }.keys.sample
  BOARD[square] = CPU
end

def tie?
  BOARD.values.none? { |v| v == ' ' }
end

def detect_winner
  WINNING_COMBOS.each do |combo|
    group = BOARD.values_at(*combo)
    if group.count(PLAYER) == 3
      return PLAYER
    elsif group.count(CPU) == 3
      return CPU
    end
  end
  false
end

def display_winner(winner)
  prompt('YOU WIN!!!') if winner == PLAYER
  prompt('THE MACHINE RACE WINS!!!') if winner == CPU
  winner
end

def display_tie(tie)
  prompt("YOU'RE BOTH WINNERS!!! (kind of)") if tie
  tie
end

def prompt(str)
  puts "~~> #{str}\n\n"
end

def reset
  BOARD.each { |k, _| BOARD[k] = ' ' }
end

loop do
  prompt("let's play TIC TAC TOE!!!")
  turn = true
  loop do
    turn ? player_turn : computer_turn
    turn = !turn
    break if display_winner(detect_winner)
    break if display_tie(tie?)
  end

  prompt("play again?")
  gets.chomp =~ /(y|yes)/i ? reset : break
end
prompt("thanks for playing!!")
