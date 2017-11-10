class WheelOfFortune
  attr_accessor :phrase, :guesses

  def initialize(inputs)
    @theme = inputs[:theme] || ""
    @phrase = inputs[:phrase] || ""
    @remaining_letters = []
    @guesses = []
  end

# displays blocks
  def to_s
    @phrase
  end

  def theme
    @theme
  end

  def can_i_have?(input)
    guess = input.downcase
    @guesses << guess
  end

  def game_over?
    if remaining_letters.length = 0 && guesses.length > 0
      true
    else
      false
    end
  end


end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j.phrase
  puts j.theme

  puts j # calls j.to_s

end
