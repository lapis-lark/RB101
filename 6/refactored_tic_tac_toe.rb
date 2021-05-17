require 'pry-byebug'

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
  ('-' * 11),
   ' ' + BOARD[1].join(' | '),
   ('-' * 11),
   ' ' + BOARD[2].join(' | ')])
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
      break
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

def horizontal
  match = []
  BOARD.each do |row| 
    match = row.join.match(/(XXX|OOO)/)
    return match[0] if match 
  end
  false
end

def rotate90(matrix)
  new_m = []
  matrix[0].size.times do |i|
    new_m << matrix.reverse.map { |row| row[i] }
  end
  new_m
end

def vertical
  match = []
  rotated = rotate90(BOARD)
  rotated.each do |row| 
    match = row.join.match(/(XXX|OOO)/)
    return match[0] if match 
  end
  false
end

def diagonal
  d1, d2 = '', ''
  BOARD.each_with_index do |row, index| 
    d1 << row[index]
    d2 << row[2 - index]
  end
  # '.' for avoiding matches made of half d1 half d2
  match = (d1 + '.' + d2).match(/(XXX|OOO)/)
  match.nil? ? false : match[0]
end

def winner?
  horizontal || vertical || diagonal
end

def display_winner(winner)
  byebug
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
  BOARD.map! { Array.new(3, ' ') }
  tic_tac_toe
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
  play_again if gets.chomp =~ /(y|yes)/
  prompt("thanks for playing!!")
end

tic_tac_toe