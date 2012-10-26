require 'httparty'
require 'json'

module Botz
  class Bot
    extend Configuration
    include HTTParty

    def initialize

    end

    def get_game_state
      response = self.class.get "/players/#{PLAYER_KEY}"

      @game_state = JSON.parse response.body

      @game_state
    end

    def make_play( move, params = {} )

      response = self.class.post "/players/#{PLAYER_KEY}/#{move}", body: params

      @game_state = JSON.parse response.body
    end

  end
end