require './lib/card'
require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort
    sorted = false
    #pass over entire deck until you never have to swap
    while !sorted
      sorted = true
      i = 0
      loop do
        #for each iteration, check if they are in order.
        if !in_order?(i)
          #if not, swap, and tell while loop that we're not sorted
          swap(i)
          sorted = false
        end
        i += 1
        if i == (@cards.length)-1 #run for every card, minus 1(second to last compares with last)
          break
        end
      end
    end
  end


  def in_order? (i)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
    #If Values are equal
    if values.index(@cards[i].value) == values.index(@cards[i + 1].value)
      #then compare suits. return value of comparison (T/F)
      suits.index(@cards[i].suit) < suits.index(@cards[i + 1].suit)
    #if values are in order, return true, otherwise, false
    elsif values.index(@cards[i].value) < values.index(@cards[i + 1].value)
      true
    else
      false
    end
  end

  def swap(deck_index)
    temp = @cards[deck_index]
    @cards[deck_index] = @cards[deck_index+1]
    @cards[deck_index+1] = temp
  end


end
