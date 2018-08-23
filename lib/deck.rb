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
        if !in_order?(@cards[i], @cards[i + 1])
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


  def in_order? (card_1, card_2)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
    #If Values are equal
    if values.index(card_1.value) == values.index(card_2.value)
      #then compare suits. return value of comparison (T/F)
      suits.index(card_1.suit) < suits.index(card_2.suit)
    #if values are in order, return true, otherwise, false
  elsif values.index(card_1.value) < values.index(card_2.value)
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

  def merge(a, b)
    result = []

    #while both arrays have something in them
    while !a.empty? && !b.empty?
      #if they're in order, shovel a[0] into result and delete it
      if in_order?(a[0], b[0])
        result << a[0]
        a.delete(a[0])
      else
        #otherwise do the same with b
        result << b[0]
        b.delete(b[0])
      end
    end
    #if a is empty, b is in order and can be added to end of result
    if a.empty?
      result.concat(b)
    end
    #same same but different
    if b.empty?
      result.concat(a)
    end

    result
  end

  def merge_sort(arr = @cards)
    #base case
    if arr.length == 1
      return arr
    end
    arr_1 = []
    arr_2 = []

    #split array in half(ish)
    arr.each.with_index do |element, index|
      if index <= arr.length/2 - 1
        arr_1 << element
      else
        arr_2 << element
      end
    end
    #call merge_sort on each half
    arr_1 = merge_sort(arr_1)
    arr_2 = merge_sort(arr_2)

    #if we're at top of stack, we need to set @cards = final merge
    if arr.length == @cards.length
      @cards = merge(arr_1, arr_2)
    end
    #or just return the merged array to next level
    merge(arr_1, arr_2)
  end

end
