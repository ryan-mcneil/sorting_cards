require './lib/deck'
require 'pry'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @card_location = 0
  end

  def current_card
    @deck.cards[@card_location]
  end

  def record_guess (guess)
    guess_string = "#{guess[:value]} of #{guess[:suit]}"
    new_guess = Guess.new(guess_string, @deck.cards[@card_location])
    @guesses << new_guess
    @card_location = (@card_location + 1) % @deck.count
    new_guess
  end

  def number_correct
    count = 0
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        count += 1
      end
    end
    count
  end

  def percent_correct
    number_correct.to_f/@guesses.count * 100
  end
end
