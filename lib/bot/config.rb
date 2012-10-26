module Bot
  module Configuration

    VALID_KEYS = [
      :api_endpoint,
      :player_key,
    ]

    API_ENDPOINT = "http://no-limit-code-em.com/api"

    PLAYER_KEY = ""

    SANDBOX_PLAYER_KEY = ""

    SANDBOX_ENDPOINT = "http://no-limit-code-em.com/sandbox"

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
      self.api_endpoint = API_ENDPOINT
      self.player_key = PLAYER_KEY
    end

  end
end