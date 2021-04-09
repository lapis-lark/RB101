=begin
### TO DO
# add clear screen method
# refactor more of the body into methods
# look at other code reviews and make improvements

=end
CHOICES = {
            'r' => 'rock',
            'p' => 'paper',
            'sc' => 'scissors',
            'l' => 'lizard',
            'sp' => 'spock'
}
WIN_CASES = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(spock paper),
  spock: %w(scissors rock)
}

victory= <<-'MSG'
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
defeat = <<-'MSG'
 ______   _______  _______  _______  _______  _______
|      | |       ||       ||       ||   _   ||       |
|  _    ||    ___||    ___||    ___||  |_|  ||_     _|
| | |   ||   |___ |   |___ |   |___ |       |  |   |
| |_|   ||    ___||    ___||    ___||       |  |   |
|       ||   |___ |   |    |   |___ |   _   |  |   |
|______| |_______||___|    |_______||__| |__|  |___|

MSG

ADJECTIVES = %w[beastly terrifying splendiferous magnanimous whimsical nonchalant absurd quixotic dreadful fluffy]

def prompt(message)
  puts ">> #{message}"
end

def generate_fighters
  fighters = CHOICES.values.map {|v| ADJECTIVES.sample + ' ' + v.upcase}
end

def display_fighters(fighters)
  prompt "Our champions this round are:"
  puts fighters.each {|fighter| puts '       ' "The #{fighter}"}
end

def valid?(choice)
  choice.downcase!
  CHOICES.include?(choice) ? true : false
end

def get_choice
  loop do
    prompt "Choose your champion with #{CHOICES.keys[0...-1].join(', ').upcase} or #{CHOICES.keys[-1].upcase}."
    player_choice = gets.chomp
    if valid?(player_choice)
      player_choice = CHOICES[player_choice]
      break player_choice
    else
      prompt "Input invalid. Try again."
    end
  end
end

def win?(first, second)
  WIN_CASES[first.to_sym].include?(second)
end

def winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  end
end

def display_grand_winner(scores, victory, defeat)
  if scores(:player) == 5
    puts victory
  elsif scores(:computer) == 5
    puts defeat
  else
    return
  end
  prompt 'Thanks for playing!'
  exit
end

scores = { player: 0, computer: 0 }
prompt "Welcome to #{CHOICES.values.join(', ').upcase}!!!"
prompt "The first to five points wins!"
loop do
  player = get_choice
  computer = CHOICES.values.sample

  prompt "You chose #{player}, and the computer chose #{computer}."
  if win?(player, computer)
    scores[:player] += 1
    prompt 'You win!'
  elsif win?(computer, player)
    scores[:computer] += 1
    prompt 'You lose!'
  else
    prompt "It's a tie!"
  end
  puts '       ' + "Your score: #{player_score}"
  puts '       ' + "Computer score: #{computer_score}"

  display_grand_winner(scores, victory, defeat)
end


player_win = win?(player, computer)
update_score()if player_win
  
computer_win = win?(computer, player)