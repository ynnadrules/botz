require 'game/card'

describe Card do

  subject { Card }

  describe '#new' do

    it 'should create a new card and have the correct value and suit and face' do
      s = subject.new '2S'

      s.value.should == 2
      s.suit.should == :spade
      s.to_s.should == '2 of Spades'

      s.face.should == '2'

      s = subject.new 'KC'

      s.value.should == Card::KING
      s.suit.should == :club
      s.to_s.should == 'King of Clubs'

      s.face.should == 'King'
    end
  end

end