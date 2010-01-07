require 'pp'
require 'lib/deck'
require 'rubygems'
require 'facets'

MANY = 10000
res = Hash.new {|h,k| h[k] = 0}

MANY.times do
  land_set = 0

  DraftDeck.new.each do |card|
    if card.land?
      land_set += 1
    else
      1.upto(land_set) do |l|
        res[l] += land_set / l
      end
      land_set = 0
    end
  end

  # cover 'land tail' case
  1.upto(land_set) do |l|
    res[l] += land_set / l
  end
end

# formatting result to %age
total_num_of_sets = res.values.sum
res.update_values{ |v| "%.4f%%" % ((v.to_f / total_num_of_sets).round_at(6)*100) }

pp res
