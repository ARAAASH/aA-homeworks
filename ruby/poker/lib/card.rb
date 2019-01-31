class Card

  SUITS = ['diamonds', 'clubs', 'hearts', 'spades']
  VALUES ={ 'A' => 1, '2' => 2, '3' => 3,
    '4' => 4, '5' => 5, '6' => 6, '7' => 7,
    '8' => 8, '9' => 9, '10' => 10, 'J' => 11,
    'Q' => 12, 'K' => 13 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    raise 'not a valid suit!' unless SUITS.include?(suit)
    raise 'not a valid rank!' unless VALUES.has_key?(rank)
    @rank, @suit = rank, suit
  end

  def get_value
    VALUES[@rank]
  end

end