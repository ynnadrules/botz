require 'json' 

class Logic

  attr_accessor :num_players, :scenario, :play, :my_move, :min_bet, :my_hand, :ante, :stack

#   scenario
#     1 : conservative
#     2 : mild  
#     3 : aggressive

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Main Method !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
  def execute (params) 
    # initalizing data
    @min_bet = params[:minimum_bet]
    @stack = params[:initial_stack]
    init_my_move()
    init_hand(params[:hand])

    # Set scenario
    init_scenario(params)

    # Set play
    analyze_hand

    # load values into my_hand
    determine_move(params)

    return @my_move
  end

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Initalizations !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  def init_my_move
    @my_move = {:action_name => nil, :amount => nil, :cards => nil}
  end

  def init_scenario( params )
    num_players = params[:players_at_table].size
    if num_players > 3 then 
      #Scenario 1
      scenario = 1
    
    elsif num_players == 3 || num_players == 2 then 
      scenario = 2
      # scenario 2
    
    else 
      scenario = 3
      # one_on_one
     end
  end

  def init_hand( hand )
    #my_hand = Card.initalize(hand)
  end
    
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Logic !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

  # Should determine what cards to replace, how good hand is, so set play
  def analyze_hand
    pairs = 0
    straight = 0
    flush = 0

    # for now be conservative
    @play = 5

    # check for pairs

    # check for flush

    # check for straight



    # check for special hands
      #full house
      #royal flush
      #straight flush
    
  end

  def determine_move(params)
    if params[:betting_phase] == "deal" # betting state
      if !my_bet  
        @action = "fold"
      else
        @action = "bet"
      end
    elsif params[:betting_phase] == "draw" # return cards 
      discard = to_discard
    elsif params[:betting_phase] == "post_draw" # betting state 
      bet = my_bet

    end

    @my_move[:action_name] = @action
    @my_move[:amount] = my_bet
    @my_move[:cards] = discard
    
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


  def to_discard 
    "Ac 5s"
  end

end

# test code
logic = Logic.new
params = {:initial_stack => 1000, :my_hand => ["2S", "TH", "AH", "AD", "2D"], :betting_phase => "deal", :minimum_bet => 10, :players_at_table => [{:name => "joe"},{:name => "marry"}] }

my_move = logic.execute(params)
puts my_move
