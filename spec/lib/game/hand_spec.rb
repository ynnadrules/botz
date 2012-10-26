require 'game/hand'
require 'game/card'

describe Hand do

  subject { Hand }

  describe '#new' do
    it 'should create a new hand with some cards' do
      cards = [
        '2H',
        'TD'
      ]

      hand = subject.new cards

      hand.should have(2).cards

      hand.cards.first.should be_a Card
      hand.cards.last.should be_a Card
    end
  end

  describe '#[]' do
    it 'should be able to get the correct card' do
      cards = [
        Card.new( '2H' ),
        Card.new( 'TD' )
      ]

      hand = subject.new cards

      hand[1].should be cards[1]
    end
  end
end