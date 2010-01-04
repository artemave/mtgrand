require 'lib/card'

class Deck
  attr_reader :cards

  def initialize(args)
    @cards = []
    land_map = []

    args[:lands].times do
      ridx = rand(args[:cards])
      redo if land_map.include?(ridx)
      land_map << ridx
    end

    args[:cards].times do |idx|
      @cards << Card.new(:land => land_map.include?(idx))
    end
  end

  def draw(num_of_cards = 1)
    @cards.slice!(0,num_of_cards)
  end
end

class DraftDeck < Deck
  def initialize
    super(:cards => 40, :lands => 17)
  end
end

