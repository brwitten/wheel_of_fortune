class WheelOfFortune
  attr_accessor :phrase, :guesses

  def initialize(inputs)
    @theme = inputs[:theme] || ""
    @phrase = inputs[:phrase] || ""
    @remaining_letters = clean_phrase
    @guesses = []
  end

  #displays blocks
  def to_s
    @phrase
    @phrase.gsub(remaining_letters, "_")
  end

  #handles guess
  def can_i_have?(input)
    guess = input.downcase
    lower_phrase = @phrase.downcase
    if guesses.include? (guess)
      puts "you already guessed this!"
    else
      @guesses << guess
      puts "CLEAN PHRASE: #{clean_phrase}"
      if clean_phrase.include? (guess)
        puts "Great guess!"
        @remaining_letters.delete(guess)
        puts @remaining_letters
        true
      else
        puts "Try again.."
        false
      end
    end
  end

  #is the game over?
  def game_over?
    if @remaining_letters.length == 0 && guesses.length > 0
      true
    else
      false
    end
  end

  #need getter so that it is read only
  def theme
    @theme
  end

  # cleaning the phrase to distinct letters;
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
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j

end
