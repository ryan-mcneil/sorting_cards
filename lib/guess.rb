require './lib/card'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    compare_string = "#{card.value} of #{card.suit}"
    @response == compare_string
  end

  def feedback
    if self.correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
