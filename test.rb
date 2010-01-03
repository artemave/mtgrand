require 'pp'
require 'lib/deck'

res = Hash.new {|h,k| h[k] = 0}

1..1000.times do
  d_deck = DraftDeck.new
  num_of_lands = 0

  d_deck.draw(7).each do |card|
    num_of_lands += 1 if card.land?
  end

  res[num_of_lands] += 1
end

pp res
