# deck structure copied from the small problems debugging problem "Card Deck"
MAXIMUM = 21
MAX_WINS = 5
DEALER_STAYS = 17

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

def score(card, num = 0)
  case card
  when Integer then card
  when :ace
    num > 10 ? 1 : 11
  else 10
  end
end

def score_hand(hand)
  num = 0
  hand.each { |card| num += score(card, num) }
  num
end

def deal_card(deck, hand)
  suit = deck.keys.sample
  hand << (deck[suit].delete(deck[suit].sample))
end

def deal_hands(deck, hands)
  2.times do 
    deal_card(deck, hands[:player])
    deal_card(deck, hands[:dealer])
  end
end

def bust?(num)
  num > MAXIMUM
end

def display_winner(winner, hands, total)
  prompt("your hand: #{format_cards(hands[:player])} \
(#{total[:player]})")

  prompt("dealer's hand: #{format_cards(hands[:dealer])} \
(#{total[:dealer]})")

  case winner
  when 'dealer' then prompt('crushing defeat!')
  when 'player' then prompt('everlasting blackjack glory is thine!')
  when 'draw' then prompt("it's a tie!")
  end
end

def player_turn_messages(hands, total)
  clear_screen

  prompt("dealer's hand: #{format_cards([hands[:dealer][0]])} \
and an unknown card")

  prompt("your hand: #{format_cards(hands[:player])} \
(#{total[:player]})")

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

def player_turn(deck, hands, total)
  loop do
    player_turn_messages(hands, total)

    case valid_move
    when 'hit'
      deal_card(deck, hands[:player])
      total[:player] += score(hands[:player][-1])
    when 'stay' then break false
    end

    break 'bust' if bust?(total[:player])
  end
end

def dealer_turn(deck, hands, total)
  until total[:dealer] >= DEALER_STAYS
    deal_card(deck, hands[:dealer])
    total[:dealer] += hands[:dealer][-1]
  end
  total[:dealer] > MAXIMUM ? 'bust' : false
end

def determine_winner(total)
  case total[:dealer] <=> total[:player]
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

def display_welcome_message
  clear_screen
  prompt("welcome to #{MAXIMUM}! try to beat the dealer to #{MAX_WINS} wins!")
end


loop do
  deal_hands(deck, hands)
  total = {player: score_hand(hands[:player]),
           dealer: score_hand(hands[:dealer])
          }

  if player_turn(deck, hands, total) == 'bust'
    prompt('you bust!')
    display_winner('dealer', hands, total)
  elsif dealer_turn(deck, hands, total) == 'bust'
    prompt('the dealer bust!')
    display_winner('player', hands, total)
  else
    display_winner(determine_winner(total), hands, total)
  end

  play_again? ? reset(hands, deck, cards) : break
end
prompt('thanks for playing!!')
