require 'pp'
require 'lib/deck'
require 'rubygems'
require 'facets'

MANY = 10000
res = Hash.new {|h,k| h[k] = {}}

MANY.times do |t|
  land_set = 0

  DraftDeck.new.each do |card|
    if card.land?
      land_set += 1
    else
      land_set = 0
    end

    1.upto(land_set) do |l|
      res[t][l] = true
    end
  end
end

final = Hash.new {|h,k| h[k] = 0}
res.each_value {|v| v.each_key {|k| final[k] += 1 }}

# formatting result to %age
final.update_values{ |v| "%.4f%%" % ((v.to_f / MANY).round_at(6)*100) }

pp final
