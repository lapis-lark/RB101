=begin
welcome
initialize deck
loop
  deal hands
  hit or stay
  dealer hit or stay
  calculate scores
  break if bust or staystay
end
display winner
play again?

=end

def prompt(str)
  puts ">> #{str}"
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
end

def deal_card(deck, hand, doer)
  suit = deck.keys.sample
  card = deck[suit].delete(deck[suit].sample)
  hand[suit] << card
  prompt("#{doer} drew a #{card} of #{suit}. . .")
end

def hit_or_stay(deck, player)
  prompt("will you hit or stay? enter 'h' for hit or 's' for stay.")
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if %w(h s).include?(ans)
    prompt('invalid. please try again.')
  end

  return ans if ans == 's'
  deal_card(deck, player, 'you')
end

def dealer_turn(deck, dealer, values)
  values[:dealer] >= 17 ? nil : deal_card(deck, dealer, 'the dealer')
end

deck = initialize_deck
player = Hash.new { |hash, key| hash[key] = [] }
dealer = player.dup
values = {player: 0, dealer: 0}

deal_hands(deck, player, dealer)
loop do
  update_hand_values(player, dealer, values)
  print_hands(player, dealer, values)
  break if hit_or_stay(deck, player) == 's'
  break if hand_value(player) >= 21
  dealer_turn(deck, dealer, values)
  break if hand_value(dealer) > 21
end