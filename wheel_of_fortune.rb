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
    return @phrase if game_over?
    display = ""
    phrase.each_char {|x|
      if @remaining_letters.include?(x.downcase)
        display = display+"_"
      else
        display = display+x
      end
    }
    return display
  end

  #handles guess
  def can_i_have?(input)
    guess = input.downcase
    lower_phrase = @phrase.downcase
    if guesses.include? (guess)
      puts "you already guessed this!"
    else
      @guesses << guess
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
    clean_phrase = @phrase.dup
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
  # p j
  # p j.to_s
  # j.can_i_have?("g")
  # p j
  # p j.to_s
  # j.can_i_have?("g")
  # j.can_i_have?("o")
  # p j
  # j.can_i_have?("e")

end
