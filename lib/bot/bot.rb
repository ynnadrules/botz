require 'httparty'
require 'json'

class Bot
  extend Configuration
  include HTTParty

  base_uri "http://no-limit-code-em.com/sandbox"


  def initialize

  end

  def get_game_state
    self.class.get "/players/#{PLAYER_KEY}"
  end

  def make_play( move )

  end

end