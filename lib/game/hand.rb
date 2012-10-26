class Hand

  attr_accessor :cards

  def initialize( cards )
    @cards = cards
  end

  def []( key )
    @cards[key]
  end

end