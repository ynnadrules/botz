require 'game/hand'
require 'game/card'

describe Hand do

  subject { Hand }

  describe '#new' do
    it 'should create a new hand with some cards' do
      cards = [
        Card.new( '2J' ),
        Card.new( 'TD' )
      ]

      hand = subject.new cards

      hand.should have(2).cards
    end
  end

  describe '#[]' do
    it 'should be able to get the correct card' do
      cards = [
        Card.new( '2J' ),
        Card.new( 'TD' )
      ]

      hand = subject.new cards

      hand[1].should be cards[1]
    end
  end
end