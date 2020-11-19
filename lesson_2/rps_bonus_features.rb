CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WIN_CASES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

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

ADJECTIVES = %w[beastly terrifying splendiferous
                magnanimous whimsical nonchalant
                absurd quixotic dreadful fluffy]

VERBS = %w[obliterated eviscerated demolished
           trounced incinerated vaporized pulverized]

ACTIVITIES = ['knitting', 'baking brownies', 'gardening',
              'watching "Whisper of the Heart"',
              'jamming on the guitar and sax']

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts ">> #{message}"
end

def generate_fighters
  CHOICES.values.map { |v| ADJECTIVES.sample + ' ' + v.upcase }
end

def display_fighters(fighters)
  prompt "Our champions this round are:"
  fighters.each { |fighter| puts '       ' "The #{fighter}" }
end

def random_fighter(fighters)
  choice = CHOICES.values.sample
  description = fighters[CHOICES.values.index(choice)]
  { choice: choice, description: description }
end

def valid?(choice)
  choice.downcase!
  CHOICES.include?(choice) ? true : false
end

def get_fighter
  prompt <<~MSG.gsub(/\n/, ' ')
          Choose your champion with
          #{CHOICES.keys[0...-1].join(', ').upcase} or
          #{CHOICES.keys[-1].upcase}.
          MSG
  gets.chomp
end

def win?(first, second)
  WIN_CASES[first[:choice]].include?(second[:choice])
end

def winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  end
end

def update_scores(winner, scores)
  if winner == 'player'
    scores[:player] += 1
  elsif winner == 'computer'
    scores[:computer] += 1
  end
end

def plural_s(str)
  str[-1].downcase == 's' ? str[0...-1] : str
end

def result_messages(player, computer)
  {
    win: "Your #{player[:description]} #{VERBS.sample} " \
           "your opponent's #{computer[:description]}!",
    lose: "Your opponent's #{computer[:description]} " \
           "#{VERBS.sample} your #{player[:description]}! ",
    tie: "Your #{plural_s(player[:description])}S spent a quiet evening " \
           "#{ACTIVITIES.sample} together."
  }
end

def display_results(player, computer, winner, scores)
  messages = result_messages(player, computer)

  if winner == 'player'
    prompt messages[:win]
  elsif winner == 'computer'
    prompt messages[:lose]
  else
    prompt messages[:tie]
  end

  prompt "Scores:"
  puts '       ' + "You: #{scores[:player]}"
  puts '       ' + "Computer: #{scores[:computer]}"
end

def grand_winner?(scores)
  scores.values.include?(5) ? true : false
end

def display_grand_winner(winner)
  if winner == 'player'
    puts VICTORY
  elsif winner == 'computer'
    puts DEFEAT
  end
end

def continue?
  prompt 'Continue to the next round? (y/n)'
  loop do
    ans = gets.chomp.downcase
    if ans == 'y'
      break true
    elsif ans == 'n'
      break false
    else
      prompt "Please reply with either 'y' or 'n'."
    end
  end
end

def display_welcome
  prompt "Welcome to #{CHOICES.values.join(', ').upcase}!!!"
end

scores = { player: 0, computer: 0 }
clear_screen
display_welcome
loop do
  fighters = generate_fighters
  display_fighters(fighters)

  player_fighter = loop do
    player = get_fighter
    if valid?(player)
      fighter = fighters[CHOICES.keys.index(player)]
      player_fighter = { choice: CHOICES[player], description: fighter }
      break player_fighter
    end
    prompt 'Invalid input. Please try again.'
  end
  computer_fighter = random_fighter(fighters)

  victor = winner(player_fighter, computer_fighter)
  update_scores(victor, scores)

  display_results(player_fighter, computer_fighter, victor, scores)
  if grand_winner?(scores)
    display_grand_winner(victor)
    break
  end

  continue? ? clear_screen : break
end
prompt 'Thanks for playing!'
