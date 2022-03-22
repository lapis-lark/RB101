def prompt(str)
  puts ">> #{str}"
end

def clear_screen
  system('clear')
end

def initialize_deck
  cards = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen',
           'King'].map(&:freeze)
  suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades'].map(&:freeze)
  deck = {}
  suits.each { |suit| deck[suit] = cards.dup }
  deck
end

def deal_hands(deck, player, dealer)
  2.times do
    suit = deck.keys.sample
    player[suit] << deck[suit].delete(deck[suit].sample)
    suit = deck.keys.sample
    dealer[suit] << deck[suit].delete(deck[suit].sample)
  end
end

def hand_value(hand)
  value = 0
  cards = hand.values.flatten
  cards.each do |card|
    case card
    when 2..10 then value += card
    when 'Ace' then value += (value < 11 ? 11 : 1)
    else value += 10
    end
  end
  value
end

def update_hand_values(player, dealer, values)
  values[:player] = hand_value(player)
  values[:dealer] = hand_value(dealer)
end

def print_hands(player, dealer, values)
  prompt("your cards (#{values[:player]})")
  player.each do |suit, cards| 
    cards.each { |c| puts "#{c} of #{suit}" }
  end
  puts ''

  prompt("dealer's cards")
  dealer.each do |suit, cards| 
    cards.each do |c| 
      puts "#{c} of #{suit}"
      break
    end
    break
  end
  puts "#{"Unknown card\n" * (dealer.values.flatten.size - 1)}"
  puts ''
end

def print_hand(hand, value, who)
  prompt("#{who} cards (#{value})")
  hand.each do |suit, cards| 
    cards.each { |c| puts "#{c} of #{suit}" }
  end
  puts ''
end

def deal_card(deck, hand, doer)
  suit = deck.keys.sample
  card = deck[suit].delete(deck[suit].sample)
  hand[suit] << card
  prompt("you drew a #{card} of #{suit}. . .") if doer == :you
  prompt("the dealer hits") if doer == :dealer
  puts ''
end

def hit_or_stay(deck, player)
  prompt("will you hit or stay? enter 'h' for hit or 's' for stay.")
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if %w(h s).include?(ans)
    prompt('invalid. please try again.')
  end

  clear_screen
  return ans if ans == 's'
  deal_card(deck, player, :you)
end

def dealer_turn(deck, dealer, values)
  if values[:dealer] >= 17
    prompt("the dealer stays") 
    puts ''
  else
    deal_card(deck, dealer, :dealer)
  end
end

def determine_winner(values)
  return :dealer if values[:player] > 21
  return :player if values[:dealer] > 21
  case values[:dealer] <=> values[:player]
  when -1 then :player
  when 0 then :tie
  when 1 then :dealer
  end
end

def update_scores(scores, winner)
  case winner
  when :player then scores[:player] += 1
  when :dealer then scores[:dealer] += 1
  end
end

def display_scores(scores)
  puts "you: #{scores[:player]}"
  puts "dealer: #{scores[:dealer]}"
  puts "\n" * 2
end

def display_winner(winner, player_value, dealer_value)
  ans = case winner
  when :player then "you win!"
  when :dealer then "the dealer wins!"
  when :tie then "it's a tie!"
  end
  prompt(ans)
end

loop do
  deck = initialize_deck
  player = Hash.new { |hash, key| hash[key] = [] }
  dealer = player.dup
  values = {player: 0, dealer: 0}
  scores = {player: 0, dealer: 0}

  deal_hands(deck, player, dealer)
  clear_screen
  loop do
    update_hand_values(player, dealer, values)
    print_hands(player, dealer, values)
    break if hit_or_stay(deck, player) == 's'
    break if hand_value(player) >= 21
    dealer_turn(deck, dealer, values)
    break if hand_value(dealer) > 21
  end
  loop do
    break if hand_value(dealer) >= 17
    dealer_turn(deck, dealer, values)
  end
  # byebug
  update_hand_values(player, dealer, values)
  winner = determine_winner(values)
  update_scores(scores, winner)
  # display_scores(scores)
  display_winner(winner, hand_value(player), hand_value(dealer))
  print_hand(player, hand_value(player), 'your')
  print_hand(dealer, hand_value(dealer), "the dealer's")

  prompt("will you play again? (y/n)")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end
prompt('thanks for playing ^^')