class Card
  def initialize(args)
    @is_land = args[:land]
  end

  def land?
    @is_land
  end
end
