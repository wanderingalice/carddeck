class Card
  attr_accessor :rank, :suit
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    puts "Your card is the #{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end

end

class Deck
  def initialize
  @ranks = [*(2..10), 'Joker', 'Queen', 'King', 'Ace']
  @suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  @cards = []
    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank,suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.first.output_card
  end

  def output
    @cards.each do |card|
        card.output_card
      end
  end
end

deck = Deck.new
deck.shuffle
deck.deal

