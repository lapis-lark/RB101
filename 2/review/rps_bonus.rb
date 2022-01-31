WIN_CASES = { 'r' => %w(sc l),
              'p' => %w(r sp),
              'sc' => %w(p l),
              'sp' => %w(r sc),
              'l' => %w(sp p) }

VALID_CHOICES = %w(r p sc sp l)

NAMES = { 'r' => 'rock',
          'p' => 'paper',
          'sc' => 'scissors',
          'sp' => 'spock',
          'l' => 'lizard' }

def prompt(str)
  puts "=> #{str}"
end

def clear_screen
  system('clear')
end

def display_scores(scores)
  clear_screen
  prompt("player: #{scores[:player]}")
  prompt("cpu: #{scores[:cpu]}")
  puts
end

def update_scores(scores, winner)
  return if winner == :tie
  scores[winner] += 1
end

def get_player_choice
  prompt("input 'r' for rock, 'p' for paper, 'sc' for scissors 'l' for lizard, or 'sp' for spock!")

  loop do
    input = gets.chomp.downcase
    break input if VALID_CHOICES.include?(input)
    prompt("invalid input. try again.")
  end
end

def get_cpu_choice
  VALID_CHOICES.sample
end

def get_winner(player, cpu)
  if player == cpu then :tie
  elsif WIN_CASES[player].include?(cpu) then :player
  else :cpu
  end
end

def display_winner(winner, player, cpu)
  message = case winner
            when :player then "you win the round!"
            when :cpu then "the cpu wins the round!"
            else "it's a tie!"
            end

  prompt("you chose #{NAMES[player]}, and the computer chose #{NAMES[cpu]}.")
  prompt(message)
end

def welcome
  clear_screen
  prompt("Welcome to RPSLS! Win 5 rounds to become the grand champion!!")
  prompt('press enter to continue')
  gets
end

def quit_now?
  prompt("enter 'q' to quit or hit enter to continue to next round.")
  gets.chomp == 'q'
end

def grandwinner?(scores)
  scores.value?(5)
end

def display_grandwinner(scores)
  clear_screen
  message = if scores[:player] > scores[:cpu]
              'you are the grandchampion!!'.upcase
            else
              'the computer is the grandchampion!!'.upcase
            end

  display_scores(scores)
  prompt(message)
  puts
end

scores = { player: 0, cpu: 0 }

welcome
loop do
  display_scores(scores)

  player = get_player_choice
  cpu = get_cpu_choice

  winner = get_winner(player, cpu)
  update_scores(scores, winner)

  if grandwinner?(scores)
    display_grandwinner(scores)
    break
  end

  display_scores(scores)
  display_winner(winner, player, cpu)
  break if quit_now?
end

prompt('thanks for playing! (;')
