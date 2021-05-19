BOARD = {}
(1..9).each { |i| BOARD[i] = ' ' }

WINNING_COMBOS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [7, 5, 3]
]

PLAYER = 'X'
CPU = 'O'
SCORE = { PLAYER => 0, CPU => 0 }
MAX_WINS = 5
WIN_NUM = 3

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

def display_board
  board = BOARD.map { |k, v| BOARD[k] == ' ' ? k : v }
  printable = []
  board.each_slice(3) do |row|
    printable << " #{row[0]} | #{row[1]} | #{row[2]}\n"
  end

  puts printable.join("---+---+---\n")
  puts ''
end

def clear_screen
  system('clear')
end

def prompt(str)
  puts "~~> #{str}\n\n"
end

def joinor(arr, sym = ', ', conj = 'or')
  case arr.size
  when 1 then arr[0]
  when 2 then "#{arr[0]} or #{arr[1]}"
  else "#{arr[0...-1].join(sym)}#{sym}#{conj} #{arr[-1]}"
  end
end

def display_available
  squares = BOARD.select { |k, _| BOARD[k] == ' ' }.keys
  prompt("which square will you mark? #{joinor(squares)}")
end

def valid_square
  loop do
    square = gets.chomp
    return square if square.to_i.to_s == square
    prompt("please input a valid integer")
  end
end

def player_turn
  display_board
  loop do
    display_available
    square = valid_square

    if BOARD[square.to_i] == ' '
      BOARD[square.to_i] = PLAYER
      break
    else
      prompt('not available. please choose again.')
    end
  end
end

def critical_move(type)
  defense = [CPU, PLAYER]
  defense.reverse! if type == 'offense'
  WINNING_COMBOS.each do |combo|
    values = BOARD.values_at(*combo)
    next if values.include?(defense[0])
    next unless values.count(defense[1]) == WIN_NUM - 1
    return combo[values.index(' ')]
  end
  false
end

def computer_turn
  square = if critical_move('offense')
             critical_move('offense')
           elsif critical_move('defense')
             critical_move('defense')
           elsif BOARD[5] == ' '
             5
           else
             BOARD.select { |k, _| BOARD[k] == ' ' }.keys.sample
           end

  BOARD[square] = CPU
end

def tie?
  BOARD.values.none? { |v| v == ' ' }
end

def update_score(round_winner)
  SCORE[round_winner] += 1
end

def winner?
  WINNING_COMBOS.each do |combo|
    group = BOARD.values_at(*combo)
    if group.count(PLAYER) == WIN_NUM
      return PLAYER
    elsif group.count(CPU) == WIN_NUM
      return CPU
    end
  end
  false
end

def display_winner(winner)
  prompt('you win the round!!') if winner == PLAYER
  prompt('the machine race wins the round!!!') if winner == CPU
  winner
end

def valid_yes?
  loop do
    ans = gets.chomp
    case ans
    when /\b(y|yes)\b/i
      break true
    when /\b(n|no)\b/i
      break false
    else
      prompt('please input either y/yes or n/no')
    end
  end
end

def change_player_character
  prompt('is "X" okay as your marker?')
  unless valid_yes?
    loop do
      prompt('input a single, non-integer character that\'s not a circle')
      char = gets.chomp
      if char =~ /\b[^O\d\s]\b/
        PLAYER[0] = char
        break
      else
        prompt("invalid input. plz try again.")
      end
    end
  end
end

def display_score
  puts "YOU: #{SCORE[PLAYER]}"
  puts "CPU: #{SCORE[CPU]}"
  puts ""
end

def display_grand_winner
  clear_screen
  display_score
  SCORE[PLAYER] == MAX_WINS ? (puts VICTORY) : (puts DEFEAT)
end

def grand_winner?
  SCORE.value?(MAX_WINS)
end

def reset
  BOARD.each { |k, _| BOARD[k] = ' ' }
end

def play_again
  prompt("play again?")
  if valid_yes?
    reset
    true
  else
    false
  end
end

def display_welcome_message
  clear_screen
  prompt("let's play TIC TAC TOE!!!")
  prompt('earn eternal glory by reaching five victories before the AI')
end

def turn_type
  prompt("do you want to go first each round, " \
  "last each round, or have it be random?")
  prompt('input "f" for first, "l" for last, or "r" for random')
  loop do
    ans = gets.chomp
    break ans if ans =~ /\b(f|l|r)\b/
    prompt("invalid input. plz try again.")
  end
end

def decide_first_player(type)
  case type
  when 'f' then true
  when 'l' then false
  when 'r' then [true, false].sample
  end
end

# body
display_welcome_message
change_player_character
type = turn_type

loop do
  turn = decide_first_player(type)
  loop do
    clear_screen
    display_score
    turn ? player_turn : computer_turn
    turn = !turn

    round_winner = winner?
    if round_winner
      update_score(round_winner)
      clear_screen
      display_score
      display_board
      display_winner(round_winner)
      break
    elsif tie?
      prompt("you both win!! (kind of)")
      break
    end
  end

  if grand_winner?
    display_grand_winner
    break
  end

  break unless play_again
end
prompt("thanks for playing!!")
