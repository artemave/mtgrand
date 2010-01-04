require 'pp'
require 'lib/deck'
require 'rubygems'
require 'facets'

MANY = 10000
res = Hash.new {|h,k| h[k] = 0}

MANY.times do
  d_deck = DraftDeck.new
  num_of_lands = 0

  d_deck.draw(7).each do |card|
    num_of_lands += 1 if card.land?
  end

  res[num_of_lands] += 1
end

# formatting result to %age
res.update_values{ |v| "%.2f%%" % ((v.to_f / MANY).round_at(4)*100) }

pp res
