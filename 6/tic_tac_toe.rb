BOARD = Array.new(3, ' ') { Array.new(3, ' ') }

POSITION = {
  'T' => 0
  'M' => 1
  'B' => 2
  'L' => 0
  'R' => 2
}

OPEN = (0..2).to_a.zip((0..2).to_a)

def display_board
  puts( 
  [' ' + BOARD[0].join(' | '),
  ('_' * 11),
   ' ' + BOARD[1].join(' | '),
   ('_' * 11),
   ' ' + BOARD[2].join(' | ')])
end

def valid_square

end

def player_turn
  display_board
  prompt("Which square will you mark?")
  puts ("TL/TM/TR\nML/MM/MR\nBL/BM/BR")
  ans = gets.chomp.upcase
  row = POSITION[ans.first]
  column = POSITION[ans.last]
  BOARD[row][column] = 'X' if 
end

def computer_turn
  position = (0..2).to_a.zip((0..2).to_a)
  columns = (0..2).to_a

end

def winner?

end

def tie?

end

def display_winner(winner)

end

def display_tie

end

def prompt(str)
  puts "~~>" + str
end

def play_again


def tic_tac_toe
  prompt("Let's play TIC TAC TOE!!!")
  loop do 
    player_turn
    computer_turn
    break if display_winner(winner?)
    break if display_tie(tie?)
  end

  prompt("play again?")
  tic_tac_toe if gets.chomp =~ /(y|yes)/
  prompt("thanks for playing!!")
end

# body
prompt("Let's play TIC TAC TOE!!!")

  if winner? == 'player'
    victory_message
    break
  elsif winner? == 'cpu'
    defeat_message
    break unless play_again?
  elsif tie? == true
    tie_message
    break
  end
end