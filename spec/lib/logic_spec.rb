require 'logic'
require 'pry'
describe Logic do
  subject { Logic }

  describe '#new' do
    it 'should create a new logic class' do

      params = {:initial_stack => 1000, :my_hand => ["2S", "TH", "AH", "AD", "2D"], :betting_phase => "deal", :minimum_bet => 10, :players_at_table => [{:name => "joe"},{:name => "marry"}] }

      logic = subject.new

    end
  end
end