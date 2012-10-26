require 'json' 
require 'game/card'
require 'game/hand'
class Logic

  attr_accessor :num_players, :scenario, :play, :my_move, :min_bet, :my_hand, :ante, :stack

#   scenario
#     1 : conservative
#     2 : mild  
#     3 : aggressive

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Main Method !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
  class << self
    def execute( params )
      l = self.new params
      l.my_move
    end
  end

  def initialize( params ) 
    # initalizing data
    @min_bet = params['minimum_bet']
    @stack = params['initial_stack']
    @hand = params['hand']
    @number_of_players = params['players_at_table'].length

    init_my_move
    init_hand

    # Set scenario
    init_scenario(params)

    # Set play
    analyze_hand

    # load values into my_hand
    determine_move(params)
  end

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Initalizations !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  def init_my_move
    @my_move = {:action_name => nil, :amount => nil, :cards => nil}
  end

  def init_scenario( params )

    if @number_of_players > 3 then 
      #Scenario 1
      scenario = 1
    
    elsif @number_of_players == 3 || @number_of_players == 2 then 
      scenario = 2
      # scenario 2
    
    else 
      scenario = 3
      # one_on_one
    end
  end

  def init_hand
    @hand = Hand.new( @hand )
  end
    
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Logic !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

  # Should determine what cards to replace, how good hand is, so set play
  def analyze_hand
    pairs = 0
    straight = 0
    flush = 0

    # for now be conservative
    @play = 3

    # check for pairs


    # check for flush

    # check for straight



    # check for special hands
      #full house
      #royal flush
      #straight flush
    
  end

  def determine_move(params)

    case params['betting_phase']
    when :deal # betting state
      if !my_bet  
        @action = :fold
      else
        @action = :bet
      end
    when :post_draw # betting state 
      @my_move[:amount] = my_bet
    end 

    @my_move[:action_name] = @action
    @my_move[:cards] = nil
    
  end

#   play
#    1 : stay_fold
#    2 : call upto less than 1/10th of current stack
#    3 : call upto less than 1/5th of stack 
#    4 : bet low
#    5 : bet high
#    6 : all-in
  def my_bet
    case @play
    when 1 then return @min_bet
    when 2 then 
      if @stack > 10 * @min_bet
        @min_bet
      end
    when 3 then
      if @stack > 5 * @min_bet
        @min_bet
      end
    when 4 then @min_bet + ((1/2) * @min_bet)
    when 5 then @min_bet + ( 2 * @min_bet)
    when 6 then @stack
    end
  end

end

