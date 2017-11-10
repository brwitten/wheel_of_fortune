class WheelOfFortune
  attr_accessor :phrase, :remaining_letters, :guesses

  def initialize(inputs)
    @theme = inputs[:theme.freeze] || ""
    @phrase = inputs[:phrase] || ""
    @remaining_letters = []
    @guesses = []
    p "Happy coding!"
  end

  def to_s
    phrase
  end

  def can_i_have?(input)
    guess = input.downcase
  end

  def game_over?
    if remaining_letters.length > 0 && guesses.length > 0
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
  puts j # calls j.to_s

end
