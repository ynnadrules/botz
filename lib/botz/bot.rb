require 'httparty'
require 'json'

module Botz
  class Bot
    extend Configuration
    include HTTParty

    attr_accessor :game_state

    VALID_ACTIONS = [ :bet, :fold, :replace ]


    class << self

      def play( &block )
        b = self.new
        loop {
          b.get_game_state

          if b.is_my_turn?
            puts "You are playing now."
            b.instance_exec( &block )
          end
          
          puts "."

          sleep 1
        }
      end

    end


    def initialize
      @game_state = nil
    end

    def get_game_state
      response = self.class.get "/players/#{Bot.player_key}"

      @game_state = JSON.parse response.body

      @game_state
    end

    def make_play( params )

      return nil unless VALID_ACTIONS.include?( params[:action_name].to_sym )

      play = {
        action_name: nil,
        amount: nil,
        cards: nil
      }

      play.merge!( params )

      puts "Making play"

      response = Bot.post "/players/#{Bot.player_key}/action", query: play

      if response.code == 200
        @game_state = JSON.parse response.body
      else
        return nil
      end
    end

    def is_my_turn?
      puts game_state.inspect
      @game_state["your_turn"] == true
    end

  end
end