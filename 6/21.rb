require 'pry-byebug'

# deck structure copied from the small problems debugging problem "Card Deck"
hands = { player: [], dealer: [] }

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { hearts: cards.clone,
         diamonds: cards.clone,
         clubs: cards.clone,
         spades: cards.clone }

def clear_screen
  system('clear')
end

def prompt(str)
  puts "~~> #{str}"
end

def format_cards(arr)
  arr = arr.map { |card| card.instance_of?(Symbol) ? card.capitalize : card }

  case arr.size
  when 1 then arr[0]
  when 2 then "#{arr[0]} and #{arr[1]}" if arr.size == 2
  else "#{arr[0...-1].join(', ')} and #{arr[-1]}"
  end
end

def score(card)
  case card
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

def score_hand(hand)
  no_aces = hand.reject { |card| card == :ace }
  total = no_aces.sum { |card| score(card) }
  if hand.include?(:ace)
    total += (total + 11 > 21 ? 1 : 11)
  end
  total
end

def deal_card(deck, hand)
  suit = deck.keys.sample
  hand << (deck[suit].delete(deck[suit].sample))
end

def deal_hands(deck, hands)
  2.times { deal_card(deck, hands[:player]) }
  2.times { deal_card(deck, hands[:dealer]) }
end

def bust?(hand)
  score_hand(hand) > 21
end

def display_winner(winner, hands)
  prompt("your hand: #{format_cards(hands[:player])}")
  prompt("your total: #{score_hand(hands[:player])}")
  prompt("dealer's hand: #{format_cards(hands[:dealer])}")
  prompt("dealer's total: #{score_hand(hands[:dealer])}")

  case winner
  when 'dealer' then prompt('crushing defeat!')
  when 'player' then prompt('everlasting glory is thine!')
  when 'draw' then prompt("it's a tie!")
  end
end

def player_turn_messages(hands)
  clear_screen
  prompt("dealer's hand: #{format_cards([hands[:dealer][0]])} " +
  "and an unknown card")
  prompt("your hand: #{format_cards(hands[:player])}")
  prompt("will you hit or stay?")
end

def valid_answer
  loop do
    case gets.chomp
    when /\b(h|hit)\b/i then break 'hit'
    when /\b(s|stay)\b/i then break 'stay'
    else prompt('Please input either h/hit or s/stay')
    end
  end
end

def player_turn(deck, hands)
  loop do
    player_turn_messages(hands)

    case valid_answer
    when 'hit' then deal_card(deck, hands[:player])
    when 'stay' then break false
    end

    break 'dealer' if bust?(hands[:player])
  end
end

def dealer_turn(deck, hands)
  total = score_hand(hands[:dealer])
  until total >= 17
    deal_card(deck, hands[:dealer])
    total = score_hand(hands[:dealer])
  end
  total > 21 ? 'bust' : false
end

def determine_winner(hands)
  case score_hand(hands[:dealer]) <=> score_hand(hands[:player])
  when -1 then 'player'
  when 0 then 'draw'
  when 1 then 'dealer'
  end
end

loop do
  deal_hands(deck, hands)
  if player_turn(deck, hands) == 'bust'
    display_winner('dealer', hands)
  elsif dealer_turn(deck, hands) == 'bust'
    display_winner('player', hands)
  else
    display_winner(determine_winner(hands), hands)
  end

  break unless false
end
