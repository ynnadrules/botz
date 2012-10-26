require 'pry'
class Card

  attr_accessor :value, :face

  JACK = 11
  QUEEN = 12
  KING = 13
  ACE = 14

  SUIT_MAP = {
    c: :club,
    d: :diamond,
    h: :heart,
    s: :spade
  }

  FACE_MAP = {
    t: 10,
    j: JACK,
    q: QUEEN,
    k: KING,
    a: ACE
  }

  REVERSE_FACE_MAP = {
    JACK => 'Jack',
    QUEEN => 'Queen',
    KING => 'King',
    ACE => 'Ace'
  }


  def initialize( code )
    map_code code.split('')
  end

  def suit
    @suit
  end

  def to_s
    "#{@face} of #{@suit.to_s.capitalize}s"
  end

  private

  def map_code( code )
    @face = code.first
    @suit = code.last

    case @face
    when '2'..'9'
      @value = @face.to_i
    else
      @value = FACE_MAP[face.downcase.to_sym]
      @face = REVERSE_FACE_MAP[@value] if @value > 10
    end

    @suit = SUIT_MAP[@suit.downcase.to_sym]
  end
end