BOARD = {}
(1..9).each { |i| BOARD[i] = ' ' }

WINNING_COMBOS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [7, 5, 3]
]

PLAYER = 'X'
CPU = 'O'

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
  puts " #{BOARD[1]} | #{BOARD[2]} | #{BOARD[3]}"
  puts '---+---+---'
  puts " #{BOARD[4]} | #{BOARD[5]} | #{BOARD[6]}"
  puts '---+---+---'
  puts " #{BOARD[7]} | #{BOARD[8]} | #{BOARD[9]}"
  puts ''
end

def clear_screen
  system('clear') || system('cls')
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

def cpu_defense
  WINNING_COMBOS.each do |combo|
    values = BOARD.values_at(*combo)
    next if values.include?(CPU)
    next unless values.count(PLAYER) == 2
    return combo[values.index(' ')]
  end
  false
end

def cpu_offense
  WINNING_COMBOS.each do |combo|
    values = BOARD.values_at(*combo)
    next if values.include?(PLAYER)
    next unless values.count(CPU) == 2
    return combo[values.index(' ')]
  end
  false
end

def computer_turn
  square = if cpu_offense
             cpu_offense
           elsif cpu_defense
             cpu_defense
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

def update_score(score, round_winner)
  score[round_winner] += 1
end

def winner?
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
  prompt('you win the round!!') if winner == PLAYER
  prompt('the machine race wins the round!!!') if winner == CPU
  winner
end

def prompt(str)
  puts "~~> #{str}\n\n"
end

def change_player_character
  prompt('is "X" okay as your marker?')
  unless gets.chomp =~ /(y|yes)/i
    loop do
      prompt("input a single character other than 'O' ")
      char = gets.chomp
      if char.size == 1 && char != 'O'
        PLAYER[0] = char
        break
      else
        prompt("invalid input. plz try again.")
      end
    end
  end
end

def display_score(score)
  puts "YOU: #{score[PLAYER]}"
  puts "CPU: #{score[CPU]}"
  puts ""
end

def display_grand_winner(score)
  clear_screen
  display_score(score)
  score[PLAYER] == 5 ? (puts VICTORY) : (puts DEFEAT)
end

def grand_winner?(score)
  score.value?(5)
end

def play_again
  prompt("play again?")
  loop do
    ans = gets.chomp
    case ans
    when /(y|yes)/i
      BOARD.each { |k, _| BOARD[k] = ' ' }
      break true
    when /(n|no)/i
      break false
    else
      prompt('please input either y/yes or n/no')
    end
  end
end

# body
prompt("let's play TIC TAC TOE!!!")
prompt('earn eternal glory by reaching five victories before the AI')
change_player_character
score = { PLAYER => 0, CPU => 0 }

loop do
  turn = [true, false].sample
  loop do
    clear_screen
    display_score(score)
    turn ? player_turn : computer_turn
    turn = !turn

    round_winner = winner?
    if round_winner
      update_score(score, round_winner)
      clear_screen
      display_score(score)
      display_board
      display_winner(round_winner)
      break
    elsif tie?
      prompt("you both win!! (kind of)")
      break
    end
  end

  if grand_winner?(score)
    display_grand_winner(score)
    break
  end

  break unless play_again
end
prompt("thanks for playing!!")
