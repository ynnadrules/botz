require 'pry'
class Hand

  attr_accessor :cards

  def initialize( cards )
    @cards = Array.new cards.length do |i|
      Card.new cards[i]
    end
  end

  def []( key )
    @cards[key]
  end

end