require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  # def sort
  #   values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
  #   suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
  #   in_order = true
  #
  #   i = 0
  #   loop do
  #     if swap
  #     i += 1
  #
  #
  #       if i == @cards.length
  #         break
  #       end
  #     end
  #   end
  #
  # end

  def in_order? (deck_index)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
    if values.index(@cards[deck_index].value) == values.index(@cards[deck_index + 1].value)
      suits.index(@cards[deck_index].suit) < suits.index(@cards[deck_index + 1].suit)
    elsif values.index(@cards[deck_index].value) < values.index(@cards[deck_index + 1].value)
      return true
    else
      return false
    end
  end

  def swap(deck_index)
    temp = @cards[deck_index]
    @cards[deck_index] = @cards[deck_index+1]
    @cards[deck_index+1] = temp
  end


end
