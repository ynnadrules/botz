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
    end
  end

  describe '#[]' do
    it 'should be able to get the correct card' do
      cards = [
        '2H',
        'TD'
      ]

      hand = subject.new cards

      hand[1].code.should == 'TD'
    end
  end
end