require 'httparty'
require 'json'

class Bot
  extend Configuration
  include HTTParty

  base_uri Configuration::TEST_ENDPOINT

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