BOARD = (Array.new(3, ' ') { Array.new(3, ' ') })

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
  line = '---+---+---'
  BOARD.each_with_index do |row, index|
    puts " #{row.join(' | ')}"
    puts line unless index == BOARD.size - 1
  end
  puts
end

def player_turn
  display_board
  prompt("which square will you mark?")
  loop do
    puts "TL|TM|TR\nML|MM|MR\nBL|BM|BR\n\n"
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

def horizontal(board)
  match = []
  board.each do |row|
    match = row.join.match(/(XXX|OOO)/)
    return match[0] if match
  end
  false
end

def vertical
  horizontal(BOARD.transpose)
end

def diagonal
  d1 = ''
  d2 = ''
  BOARD.each_with_index do |row, index|
    d1 << row[index]
    d2 << row[2 - index]
  end
  # '.' for avoiding matches made of half d1 half d2
  match = "#{d1}.#{d2}".match(/(XXX|OOO)/)
  match.nil? ? false : match[0]
end

# using this style of winner evaluation rather than hardcoded
# winning combinations allows for checking any size of array...
# but it's probably overkill for tic tac toe
def winner?
  horizontal(BOARD) || vertical || diagonal
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
  BOARD.map! { Array.new(3, ' ') }
  OPEN.delete_at(0) until OPEN.empty?
  (0..2).each { |y| (0..2).each { |x| OPEN << [y, x] } }
  tic_tac_toe
end

def tic_tac_toe
  prompt("let's play TIC TAC TOE!!!")
  turn = 0
  loop do
    turn.even? ? player_turn : computer_turn
    turn += 1
    break if display_winner(winner?)
    break if display_tie(tie?)
  end

  prompt("play again?")
  play_again if gets.chomp =~ /(y|yes)/
  prompt("thanks for playing!!")
end

tic_tac_toe
