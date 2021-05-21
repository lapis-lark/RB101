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

def score(card, total)
  case card
  when Integer then card
  when :ace
    total > 10 ? 1 : 11
  else 10
  end
end

# fix me :(
def score_hand(hand)
  total = 0
  hand.each { |card| total += score(card, total) }
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
  prompt("your hand: #{format_cards(hands[:player])} \
(#{score_hand(hands[:player])})")

  prompt("dealer's hand: #{format_cards(hands[:dealer])} \
(#{score_hand(hands[:dealer])})")

  case winner
  when 'dealer' then prompt('crushing defeat!')
  when 'player' then prompt('everlasting glory is thine!')
  when 'draw' then prompt("it's a tie!")
  end
end

def player_turn_messages(hands)
  clear_screen

  prompt("dealer's hand: #{format_cards([hands[:dealer][0]])} \
and an unknown card")

  prompt("your hand: #{format_cards(hands[:player])} \
(#{score_hand(hands[:player])})")

  prompt("will you hit or stay?")
end

def valid_move
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

    case valid_move
    when 'hit' then deal_card(deck, hands[:player])
    when 'stay' then break false
    end

    break 'bust' if bust?(hands[:player])
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

def reset(hands, deck, cards)
  hands.each { |k, _| hands[k] = [] }
  deck.each { |k, _| deck[k] = cards.clone }
end

def play_again?
  prompt('will you play again? (y/yes or n/no)')
  loop do
    ans = gets.chomp
    case ans
    when /\b(y|yes)\b/i
      break true
    when /\b(n|no)\b/i
      break false
    else
      prompt('please input either y/yes or n/no')
    end
  end
end

loop do
  deal_hands(deck, hands)
  if player_turn(deck, hands) == 'bust'
    prompt('you bust!')
    display_winner('dealer', hands)
  elsif dealer_turn(deck, hands) == 'bust'
    prompt('the dealer bust!')
    display_winner('player', hands)
  else
    display_winner(determine_winner(hands), hands)
  end

  play_again? ? reset(hands, deck, cards) : break
end
prompt('thanks for playing!!')
