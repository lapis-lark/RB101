BOARD = Array.new(3, ' ') { Array.new(3, ' ') }

POSITION = {
  'T' => 0,
  'M' => 1,
  'B' => 2,
  'L' => 0,
  'R' => 2
}

OPEN = []
(0..2).each { |y| (0..2).each { |x| OPEN << [y, x] } }

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
  loop do
    puts ("TL/TM/TR\nML/MM/MR\nBL/BM/BR")
    ans = gets.chomp.upcase
    row = POSITION[ans[0]]
    column = POSITION[ans[1]]
    if OPEN.include?([row, column])
      BOARD[row][column] = 'X'
      OPEN.delete([row, column])
      #break
    else
      prompt('Not available. Please choose again.')
    end
  end
end

def computer_turn
  mark = OPEN.sample
  BOARD[mark.first][mark.last] = 'O'
  OPEN.delete(mark)
end


def tie?
  OPEN.empty?
end

def winner?

end

def display_winner(winner)
  prompt(winner + ' WIN!!!') if winner == 'YOU'
  prompt(winner + ' WINS!!!') if winner == 'THE MACHINE RACE'
  winner
end

def display_tie(tie)
  prompt("YOU'RE BOTH WINNERS!!! (kind of)") if tie
  tie
end

def prompt(str)
  puts "~~>" + str
end

def play_again

end


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