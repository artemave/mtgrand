require './lib/card'

class Deck
  attr_reader :cards

  def initialize(num_of_cards, num_of_lands)
    @cards = []
    land_map = []

    num_of_lands.times do
      ridx = rand(num_of_cards)
      redo if land_map.include?(ridx)
      land_map << ridx
    end

    num_of_cards.times do |idx|
      @cards << Card.new(:land => land_map.include?(idx))
    end
  end

  def draw(num_of_cards = 1)
    @cards.slice!(0,num_of_cards)
  end
end

class DraftDeck < Deck
  def initialize
    super(40,17)
  end
end

