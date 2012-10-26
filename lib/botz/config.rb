module Botz
  module Configuration

    VALID_KEYS = [
      :api_endpoint,
      :player_key,
      :sandbox_player_key,
      :sandbox_endpoint
    ]

    API_ENDPOINT                = "http://no-limit-code-em.com/api"

    PLAYER_KEY                  = "28b7053e-e5bd-40cd-913a-1d1e52a0ba0f"

    SANDBOX_PLAYER_KEY          = ""

    SANDBOX_ENDPOINT            = "http://no-limit-code-em.com/sandbox"

    TEST_PLAYER_KEYS = {
      bet: "",  # use this to get a game state where you must respond with a bet
      cards: "" #use this to get a game state where you must respond with a replacement of cards
    }

    attr_accessor( *VALID_KEYS )

    def configure
      yield self
    end

    def self.extended( base ) 
      base.set_defaults
    end

    def set_defaults
      self.api_endpoint         = API_ENDPOINT
      self.player_key           = PLAYER_KEY
      self.sandbox_player_key   = SANDBOX_PLAYER_KEY
      self.sandbox_endpoint     = SANDBOX_ENDPOINT
    end

  end
end