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

  def can_i_have?(input)
    guess = input.downcase
    lower_phrase = @phrase.downcase
    @guesses << guess
    puts "CLEANED PHRASE: #{cleaned_phrase}"
    if clean_phrase.include? (guess)
      puts guess
    end
  end

  def game_over?
    if remaining_letters.length = 0 && guesses.length > 0
      true
    else
      false
    end
  end

  #need getter so that it is read only
  def theme
    @theme
  end

  # cleaning the phrase to distinct letters, no spaces
  def clean_phrase
    clean_phrase = @phrase.to_s
    clean_phrase.downcase!
    clean_phrase.squeeze!
    clean_phrase.gsub!(/[[:space:]]/, '')
    clean_phrase = clean_phrase.split(//)
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
  # puts j.guess

  puts j # calls j.to_s

end
